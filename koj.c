#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/gpio.h>		
#include <linux/interrupt.h>	
#include <linux/kobject.h>	
#include <linux/time.h>		
#include <linux/sysfs.h>
#include <linux/slab.h>
#define  DEBOUNCE_TIME 200	

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Derek Molloy");
MODULE_DESCRIPTION("A simple Linux GPIO Button LKM for the BBB");
MODULE_VERSION("0.1");

static bool isRising = 1;	
module_param(isRising, bool,S_IRUGO);
MODULE_PARM_DESC(isRising,"Rising edge = 1 (default), Falling edge = 0");	

static /*unsigned*/ int gpioButton = 115;	
module_param(gpioButton, uint,S_IRUGO);	
MODULE_PARM_DESC(gpioButton,"GPIO Button number (default=115)");	

static /*unsigned*/ int gpioLED = 49;	
module_param(gpioLED, uint,S_IRUGO);	
MODULE_PARM_DESC(gpioLED,"GPIO LED number (default=49)");	

static char gpioName[8] = "gpioXXX";	
static int irqNumber;		
static int numberPresses = 0;	
static bool ledOn = 0;	
static bool isDebounce = 1;
static struct timespec ts_last, ts_current, ts_diff;	

static irq_handler_t ebbgpio_irq_handler(unsigned int irq, void *dev_id,struct pt_regs *regs);

static ssize_t numberPresses_show(struct kobject *kobj, struct kobj_attribute *attr,char *buf)
{
  return sprintf(buf, "%d\n", numberPresses);
}


static ssize_t numberPresses_store(struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
  sscanf (buf, "%du", &numberPresses);
  return count;
}


static ssize_t ledOn_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
{
  return sprintf(buf, "%d\n", ledOn);
}


static ssize_t lastTime_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
{
  return sprintf(buf, "%.2lu:%.2lu:%.2lu:%.9lu \n",(ts_last.tv_sec / 3600) % 24, (ts_last.tv_sec / 60) % 60,ts_last.tv_sec % 60, ts_last.tv_nsec);
}


static ssize_t diffTime_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
{
  return sprintf(buf, "%lu.%.9lu\n", ts_diff.tv_sec, ts_diff.tv_nsec);
}


static ssize_t isDebounce_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
{
  return sprintf(buf, "%d\n", isDebounce);
}


static ssize_t isDebounce_store(struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
  unsigned int temp;
  sscanf(buf, "%du", &temp);	
  gpio_set_debounce(gpioButton, 0);
  isDebounce = temp;
  if(isDebounce)
    {
      gpio_set_debounce(gpioButton, DEBOUNCE_TIME);
      printk(KERN_INFO "EBB Button: Debounce on\n");
    }
  else
    {
      gpio_set_debounce(gpioButton, 0);	
      printk(KERN_INFO "EBB Button: Debounce off\n");
    }
  return count;
}


static struct kobj_attribute count_attr = __ATTR(numberPresses, 0660, numberPresses_show, numberPresses_store);
static struct kobj_attribute debounce_attr = __ATTR(isDebounce, 0660, isDebounce_show, isDebounce_store);

static struct kobj_attribute ledon_attr = __ATTR_RO(ledOn);
static struct kobj_attribute time_attr = __ATTR_RO(lastTime);	
static struct kobj_attribute diff_attr = __ATTR_RO(diffTime);	

static struct attribute *ebb_attrs[] = {
  &count_attr.attr,		
  &ledon_attr.attr,		
  &time_attr.attr,		
  &diff_attr.attr,		
  &debounce_attr.attr,		
  NULL,
};

static struct attribute_group attr_group = {
  .name = gpioName,		
  .attrs = ebb_attrs,		
};

static struct kobject *ebb_kobj;

static int __init ebbButton_init(void)
{
  int result = 0;
  unsigned long IRQflags = IRQF_TRIGGER_RISING;	

  printk(KERN_INFO "EBB Button: Initializing the EBB Button LKM\n");
  sprintf(gpioName, "gpio%d", gpioButton);	

  ebb_kobj = kobject_create_and_add("ebb", kernel_kobj->parent);	
  if(!ebb_kobj)
    {
      printk(KERN_ALERT "EBB Button: failed to create kobject mapping\n");
      return -ENOMEM;
    }
  result = sysfs_create_group(ebb_kobj, &attr_group);
  if(result)
    {
      printk(KERN_ALERT "EBB Button: failed to create sysfs group\n");
      kobject_put(ebb_kobj);	
      return result;
    }
  getnstimeofday(&ts_last);	
  ts_diff = timespec_sub(ts_last, ts_last);	

  ledOn = true;
  gpio_request(gpioLED, "sysfs");
  gpio_direction_output(gpioLED, ledOn);
  gpio_export(gpioLED, false);	
  gpio_request(gpioButton, "sysfs");	
  gpio_direction_input(gpioButton);	
  gpio_set_debounce(gpioButton, DEBOUNCE_TIME);
  gpio_export(gpioButton, false);	

  printk(KERN_INFO "EBB Button: The button state is currently: %d\n",gpio_get_value (gpioButton));

  irqNumber = gpio_to_irq(gpioButton);
  printk(KERN_INFO "EBB Button: The button is mapped to IRQ: %d\n",irqNumber);

  if(!isRising)
    {			
      IRQflags = IRQF_TRIGGER_FALLING;	
    }
  result = request_irq(irqNumber,	
			(irq_handler_t) ebbgpio_irq_handler,	
			IRQflags,	
			"ebb_button_handler",	
			NULL);
  return result;
}

static void __exit ebbButton_exit(void)
{
  printk(KERN_INFO "EBB Button: The button was pressed %d times\n",numberPresses);
  kobject_put(ebb_kobj);	
  gpio_set_value(gpioLED, 0);
  gpio_unexport(gpioLED);
  free_irq(irqNumber, NULL);	
  gpio_unexport(gpioButton);	
  gpio_free(gpioLED);
  gpio_free(gpioButton);	
  printk(KERN_INFO "EBB Button: Goodbye from the EBB Button LKM!\n");
}

static irq_handler_t ebbgpio_irq_handler(unsigned int irq, void *dev_id, struct pt_regs *regs)
{
  ledOn = !ledOn;		
  gpio_set_value(gpioLED, ledOn);	
  getnstimeofday(&ts_current);	
  ts_diff = timespec_sub(ts_current, ts_last);	
  ts_last = ts_current;		
  printk(KERN_INFO "EBB Button: The button state is currently: %d\n",gpio_get_value (gpioButton));
  numberPresses++;		
  return(irq_handler_t) IRQ_HANDLED;	
}

module_init(ebbButton_init);
module_exit(ebbButton_exit);
