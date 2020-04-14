#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/slab.h>
#include <linux/gpio.h>
#include <linux/interrupt.h>

#define app1 105
#define sw1  106
#define app2  83
#define sw2    7
#define app3  82
#define sw3   20

//static char gpioname[8] = "gpioxxx";
static int ledon1 = 0;
static int ledon2 = 0;
static int ledon3 = 0;
static unsigned int irqnumber1;
static unsigned int irqnumber2;
static unsigned int irqnumber3;
static int numberpress1;
static int numberpress2;
static int numberpress3;
static int debounce;
/*static unsigned int value1;
static unsigned int value2;
static unsigned int value3;*/

static irqreturn_t gpio_interrupt1(int irq, void *dev_id)
{
	ledon1 = !ledon1;
	gpio_set_value(app1,ledon1);
	printk(KERN_INFO"The switch state is %d\n",gpio_get_value(sw1));
	numberpress1++;
	printk(KERN_INFO"This interrupt is occured these many times %d\n",numberpress1);
	return IRQ_NONE;
}

static irqreturn_t gpio_interrupt2(int irq, void *dev_id)
{
	ledon2 = !ledon2;
	gpio_set_value(app2,ledon2);
	printk(KERN_INFO"The switch state is %d\n",gpio_get_value(sw2));
	numberpress2++;
	printk(KERN_INFO"This interrupt is occured these many times %d\n",numberpress2);
	return IRQ_NONE;
}

static irqreturn_t gpio_interrupt3(int irq, void *dev_id)
{
	ledon3 = !ledon3;
	gpio_set_value(app3,ledon3);
	printk(KERN_INFO"The switch state is %d\n",gpio_get_value(sw3));
	numberpress3++;
	printk(KERN_INFO"This interrupt is occured these many times %d\n",numberpress3);
	return IRQ_NONE;
}

static struct gpio leds_gpios[] = {
	{  sw1, GPIOF_DIR_IN, "Power SW1" },
	{ app1, GPIOF_DIR_OUT, "Power LED1" },
	{  sw2, GPIOF_DIR_IN, "Power SW2" },
	{ app2, GPIOF_DIR_OUT, "Power LED2" },
	{  sw3, GPIOF_DIR_IN, "Power SW3" },
	{ app3, GPIOF_DIR_OUT, "Power LED3" },
};

static ssize_t clip1_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{
	return sprintf(buf,"%d\n",ledon1);
}

static ssize_t clip1_store(struct kobject *kobj,struct kobj_attribute *attr,const char *buf,size_t count)
{
	sscanf(buf,"%d",&ledon1);
	gpio_set_value(app1,ledon1);
	return count;
}

static ssize_t trip1_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{

	debounce = gpio_get_value(sw1);
	return sprintf(buf,"%d\n",debounce);
}

static ssize_t clip2_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{
	return sprintf(buf,"%d\n",ledon2);
}

static ssize_t clip2_store(struct kobject *kobj,struct kobj_attribute *attr,const char *buf,size_t count)
{
	sscanf(buf,"%d",&ledon2);
	gpio_set_value(app2,ledon2);
	return count;
}

static ssize_t trip2_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{

	debounce = gpio_get_value(sw2);
	return sprintf(buf,"%d\n",debounce);
}

static ssize_t clip3_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{
	return sprintf(buf,"%d\n",ledon3);
}

static ssize_t clip3_store(struct kobject *kobj,struct kobj_attribute *attr,const char *buf,size_t count)
{
	sscanf(buf,"%d",&ledon3);
	gpio_set_value(app3,ledon3);
	return count;
}

static ssize_t trip3_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{

	debounce = gpio_get_value(sw3);
	return sprintf(buf,"%d\n",debounce);
}

static struct kobj_attribute clip1_attribute = __ATTR(clip1,0664,clip1_show,clip1_store);
static struct kobj_attribute trip1_attribute = __ATTR_RO(trip1);
static struct kobj_attribute clip2_attribute = __ATTR(clip2,0664,clip2_show,clip2_store);
static struct kobj_attribute trip2_attribute = __ATTR_RO(trip2);
static struct kobj_attribute clip3_attribute = __ATTR(clip3,0664,clip3_show,clip3_store);
static struct kobj_attribute trip3_attribute = __ATTR_RO(trip3);

static struct attribute *attrs[] = {
	&clip1_attribute.attr,
	&trip1_attribute.attr,
	&clip2_attribute.attr,
	&trip2_attribute.attr,
	&clip3_attribute.attr,
	&trip3_attribute.attr,
	NULL,
};

static struct attribute_group attr_group = {
//	.name	= gpioname,
	.attrs 	= attrs,
};

static struct kobject *gpio_kobj;

static int __init start(void)
{
	int retval,err;
	//sprintf(gpioname,"gpio%d",led1);

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

	gpio_set_debounce(sw1,200);
	printk(KERN_INFO"The switch state is %d\n",gpio_get_value(sw1));
	irqnumber1 = gpio_to_irq(sw1);
	printk(KERN_INFO"The Gpio generated interrupt number is %d\n",irqnumber1);

	gpio_set_debounce(sw2,200);
	printk(KERN_INFO"The switch state is %d\n",gpio_get_value(sw2));
	irqnumber2 = gpio_to_irq(sw2);
	printk(KERN_INFO"The Gpio generated interrupt number is %d\n",irqnumber2);

	gpio_set_debounce(sw3,200);
	printk(KERN_INFO"The switch state is %d\n",gpio_get_value(sw3));
	irqnumber3 = gpio_to_irq(sw3);
	printk(KERN_INFO"The Gpio generated interrupt number is %d\n",irqnumber3);

	/*request_irq(unsigned int irq, irq_handler_t handler, unsigned long flags,const char *name, void *dev)*/
	if(request_irq(irqnumber1,gpio_interrupt1,IRQF_TRIGGER_RISING,"Gpio_interrupt1",NULL) < 0)
	{
		printk(KERN_ERR"This gpio is not produced the interrupt in the kernel space\n");
		return -EINVAL;
	}
	
	if(request_irq(irqnumber2,gpio_interrupt2,IRQF_TRIGGER_RISING,"Gpio_interrupt2",NULL) < 0)
	{
		printk(KERN_ERR"This gpio is not produced the interrupt in the kernel space\n");
		return -EINVAL;
	}
	
	if(request_irq(irqnumber3,gpio_interrupt3,IRQF_TRIGGER_RISING,"Gpio_interrupt3",NULL) < 0)
	{
		printk(KERN_ERR"This gpio is not produced the interrupt in the kernel space\n");
		return -EINVAL;
	}

	return retval;
}

static void __exit stop(void)
{
	free_irq(irqnumber1,NULL);
	free_irq(irqnumber2,NULL);
	free_irq(irqnumber3,NULL);
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
