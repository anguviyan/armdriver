#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/gpio.h>
#include <linux/time.h>
#include <linux/sysfs.h>
#include <linux/gpio.h>
#include <linux/interrupt.h>
#include <linux/kobject.h>
#include <linux/slab.h>

static unsigned int button = 20;
module_param(button,uint,S_IRWXU);
MODULE_PARM_DESC(button,"This will be displayed in the /sys/kernel");

static bool irq_flag = 1;
module_param(irq_flag,bool,S_IRWXU);
MODULE_PARM_DESC(irq_flag,"This irq_state represent the interrupt flags");

static unsigned int led = 105;
module_param(led,uint,S_IRWXU);
MODULE_PARM_DESC(led,"This will be displayed in the /sys/kernel");

static /*bool*/int ledon = 0;
static /*bool*/int debounce = 1;
static int irqnumber;
static int numberpress;
static int debounce_time = 200;
static char gpioname[8] = "gpioXXX";


static ssize_t numberpress_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{
	return sprintf(buf,"%d\n",numberpress);
}

static ssize_t ledon_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{
	return sprintf(buf,"%d\n",ledon);
}

static ssize_t debounce_show(struct kobject *kobj,struct kobj_attribute *attr,char *buf)
{
	return sprintf(buf,"%d\n",debounce);
}

static ssize_t debounce_store(struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
	unsigned int temp;
	sscanf(buf,"%d",&temp);
	/*gpio_set_debounce(button,0);
	if(temp)
	{
		gpio_set_debounce(button,debounce_time);
	}else{
		gpio_set_debounce(button,0);
	}*/
	gpio_set_value(led,temp);
	return count;
}

static struct kobj_attribute numberpress_attr 	= __ATTR_RO(numberpress);
static struct kobj_attribute ledon_attr 	= __ATTR_RO(ledon);
static struct kobj_attribute debounce_attr 	= __ATTR(debounce,0664,debounce_show,debounce_store);

static struct attribute *attrs[] = {
	&ledon_attr.attr,
	&debounce_attr.attr,
	&numberpress_attr.attr,
	NULL,
};

static struct attribute_group attr_group = {
	.name	=	gpioname,
	.attrs	=	attrs,
};

static struct kobject *example_kobj;

static irqreturn_t my_interrupt (int irq, void *dev_id)
{
	ledon = !ledon;
	gpio_set_value(led,ledon);
	printk(KERN_INFO"The Button state is %d\n",gpio_get_value(button));
	numberpress++;
	return IRQ_NONE;
}

static int __init start(void)
{
	int retval = 0;
	unsigned long flag = IRQF_TRIGGER_RISING;

	printk(KERN_INFO"WEGA Button stage is initiated\n");
	sprintf(gpioname,"gpio%d",button);
	printk(KERN_INFO"The gpio name is %d\n",button);
	
	example_kobj = kobject_create_and_add("kobject_example", kernel_kobj);
	if (!example_kobj)
	{
		printk(KERN_ALERT"Failed to create kobject mapping\n");
		return -ENOMEM;
	}

	retval = sysfs_create_group(example_kobj, &attr_group);
	if(retval)
	{
		printk(KERN_ALERT"Failed to create kobject mapping\n");
		kobject_put(example_kobj);
		return retval;
	}
	
	if(!(gpio_is_valid(led)))
	{
		printk(KERN_ERR"This gpio%d is not valid\n",led);
		return -EINVAL;
	}
	gpio_request(led,"sysfs");
	gpio_export(led,true);
	gpio_direction_output(led,1);

	if(!(gpio_is_valid(button)))
	{
		printk(KERN_ERR"This gpio%d is not valid\n",button);
		return -EINVAL;
	}
	gpio_request(button,"sysfs");
	gpio_export(button,true);
	gpio_direction_input(button);
	gpio_set_debounce(button,debounce_time);

	printk(KERN_INFO"The Button state is %d\n",gpio_get_value(button));
	irqnumber = gpio_to_irq(button);
	printk(KERN_INFO"The gpio generated irq number is %d\n",irqnumber);

	if(!irq_flag)
	{
		flag = IRQF_TRIGGER_FALLING;
	}

	/*request_irq(unsigned int irq, irq_handler_t handler, unsigned long flags,const char *name, void *dev)*/
	if(request_irq(irqnumber,(irq_handler_t)my_interrupt,flag,"My_interrupt",NULL) < 0)
	{
		printk(KERN_ERR"This gpio is not generated the interrupt in the kernel\n");
		return -EINVAL;
	}

	return retval;
}

static void __exit stop(void)
{
	free_irq(irqnumber,NULL);
	gpio_set_value(led,0);
	gpio_unexport(led);
	gpio_unexport(button);
	gpio_free(led);
	gpio_free(button);
	kobject_put(example_kobj);
	printk(KERN_INFO"This gpio's functions with this driver is removed from the kernel\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_VERSION("V0.1");
MODULE_AUTHOR("sriramdhivakar.M");
MODULE_DESCRIPTION("This module is based on the kobject");
