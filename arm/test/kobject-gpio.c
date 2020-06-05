#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/slab.h>
#include <linux/gpio.h>
#include <linux/interrupt.h>

#define led 105
#define sw   20

//static char gpioname[8] = "gpioxxx";//For sub-directory
static int ledon = 0;
static unsigned int irqnumber;
static int numberpress;
static int debounce = 200;

static irqreturn_t gpio_interrupt(int irq, void *dev_id)
{
	ledon = !ledon;
	gpio_set_value(led,ledon);
	printk(KERN_INFO"The switch state is %d\n",gpio_get_value(sw));
	numberpress++;
	printk(KERN_INFO"This interrupt is occured these many times %d\n",numberpress);
	return IRQ_NONE;
}

static struct gpio leds_gpios[] = {
	{  sw, GPIOF_DIR_IN, "Power SW" },
	{ led, GPIOF_DIR_OUT, "Power LED" },
};

/*static ssize_t led_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{
	return sprintf(buf,"%d\n",ledon);
}*/

static ssize_t leds_store(struct kobject *kobj,struct kobj_attribute *attr,const char *buf,size_t count)
{
	unsigned int value;
	sscanf(buf,"%d",&value);
	gpio_set_value(led,value);
	return count;
}

/*static ssize_t sw_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{
	return sprintf(buf,"%d\n",debounce);
}

static ssize_t sw_store(struct kobject *kobj,struct kobj_attribute *attr,const char *buf,size_t count)
{
	unsigned int temp;
	sscanf(buf,"%d",&temp);
	gpio_set_debounce(sw,temp);
	return count;
}*/

static struct kobj_attribute leds_attribute = __ATTR_WO(leds);
/*static struct kobj_attribute led_attribute = __ATTR(leds,0664,led_show,led_store);
static struct kobj_attribute sw_attribute  = __ATTR(switch_debounce,0664,sw_show,sw_store);*/

static struct attribute *attrs[] = {
	&leds_attribute.attr,
//	&sw_attribute.attr,
	NULL,
};

static struct attribute_group attr_group = {
//	.name	= gpioname,//For sub-directory
	.attrs 	= attrs,
};

static struct kobject *gpio_kobj;

static int __init start(void)
{
	int retval,err;
//	sprintf(gpioname,"gpio%d",led);//For sub-directory

	gpio_kobj = kobject_create_and_add("GPIO_EXAMPLE",kernel_kobj);
	if(!gpio_kobj)
		return -ENOMEM;

	retval = sysfs_create_group(gpio_kobj,&attr_group);
	if(retval)
		kobject_put(gpio_kobj);
	err = gpio_request_array(leds_gpios,ARRAY_SIZE(leds_gpios));
	if(err)
	{
		printk(KERN_ERR"This gpios is not enabled\n");
		return -EINVAL;
	}

	gpio_set_debounce(sw,debounce);
	printk(KERN_INFO"The switch state is %d\n",gpio_get_value(sw));
	irqnumber = gpio_to_irq(sw);
	printk(KERN_INFO"The Gpio generated interrupt number is %d\n",irqnumber);

	/*request_irq(unsigned int irq, irq_handler_t handler, unsigned long flags,const char *name, void *dev)*/
	if(request_irq(irqnumber,gpio_interrupt,IRQF_TRIGGER_RISING,"Gpio_interrupt",NULL) < 0)
	{
		printk(KERN_ERR"This gpio is not produced the interrupt in the kernel space\n");
		return -EINVAL;
	}

	return retval;
}

static void __exit stop(void)
{
	free_irq(irqnumber,NULL);
	gpio_free_array(leds_gpios,ARRAY_SIZE(leds_gpios));
	kobject_put(gpio_kobj);
	printk(KERN_INFO"This driver and gpio is removed from the kernel\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_VERSION("V0.1");
MODULE_AUTHOR("sriramdhivakar.M");
MODULE_DESCRIPTION("This module is based on the kobject gpio");
