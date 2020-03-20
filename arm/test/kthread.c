#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/kobject.h>
#include <linux/gpio.h>
/***********************************************KTHREAD*****************************************/
#include <linux/kthread.h>
/**********************************************************************************************/
#include <linux/delay.h>

static unsigned int led = 105;
module_param(led,uint,S_IRWXU);
MODULE_PARM_DESC(led,"This module is should be display in the /sys kernel");

static unsigned int blinkperiod = 1000;
module_param(blinkperiod,uint,S_IRWXU);
MODULE_PARM_DESC(blinkperiod,"This module is should be display in the /sys kernel");

static bool ledon = 0;

enum modes {
	ON,OFF,FLASH
};

static enum modes mode = FLASH;

static ssize_t mode_show(struct kobject *kobj, struct kobj_attribute *attr,char *buf)
{
	switch(mode)
	{
		case ON:
			return sprintf(buf,"on\n");
		case OFF:
			return sprintf(buf,"off\n");
		case FLASH:
			return sprintf(buf,"flash\n");
		default:
			return sprintf(buf,"error in LKM\n");
	}
}

static ssize_t mode_store(struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
	if(strncmp(buf,"on",count-1)==0){
		mode = ON;
	}
	else if(strncmp(buf,"off",count-1)==0){
		mode = OFF;
	}
	else if(strncmp(buf,"flash",count-1)==0){
		mode = FLASH;
	}

	return count;	
}
static ssize_t period_show(struct kobject *kobj, struct kobj_attribute *attr,char *buf)
{
	return sprintf(buf,"%d\n",blinkperiod);
}
static ssize_t period_store(struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
	unsigned int temp;
	sscanf(buf,"%d",&temp);
	if((temp > 1)&&(temp <=1000))
	{
		blinkperiod = temp;
	}

	return temp;
}

static struct kobj_attribute mode_attribute = __ATTR(mode, 0664, mode_show, mode_store);
static struct kobj_attribute period_attribute = __ATTR(period, 0664, period_show,period_store);

static struct attribute *attrs[] = {
	&mode_attribute.attr,
	&period_attribute.attr,
	NULL,
};

static struct attribute_group attr_group = {
	.name = "Automation",
	.attrs = attrs,
};

static struct kobject *Home_Automation;
static struct task_struct *task;

/***********************************************KTHREAD*****************************************/
static int flash(void *arg)
{
	printk(KERN_INFO"This THREAD start running\n");

	while(!kthread_should_stop())
	{
		set_current_state(TASK_RUNNING);

		if(mode == FLASH)
			ledon = !ledon;
		else if (mode == ON)
			ledon = true;
		else
			ledon = false;
		gpio_set_value(led,ledon);
		set_current_state(TASK_INTERRUPTIBLE);
		msleep(blinkperiod/2);
	}
	printk(KERN_INFO"Thread run to completion\n");
	return 0;
}
/**********************************************************************************************/

static int __init start(void)
{
	int retval,err;
	Home_Automation = kobject_create_and_add("Home_automation", kernel_kobj);
	if(!Home_Automation)
		return -ENOMEM;
	retval = sysfs_create_group(Home_Automation, &attr_group);
	if(retval)
		kobject_put(Home_Automation);
	err = gpio_request_one(led,GPIOF_DIR_OUT,"LED");
	if(err)
	{
		printk(KERN_ERR"This gpio%d is not export in the kernel\n",led);
		return -EINVAL;
	}

/***********************************************KTHREAD*****************************************/
	task = kthread_run(flash,NULL,"LED_Flash_Thread");
	if(IS_ERR(task))
	{
		printk(KERN_ALERT "EBB LED: failed to create the task\n");
		return PTR_ERR(task);
	}
/**********************************************************************************************/
	return retval;
}

static void __exit stop(void)
{
	kthread_stop(task);
	gpio_unexport(led);
	gpio_free(led);
	kobject_put(Home_Automation);
	printk(KERN_INFO"This module with GPIO is removed from the kernel\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_AUTHOR("sriramdhivakar.M");
MODULE_VERSION("V0.1");
MODULE_DESCRIPTION("This module is based on the Kthread");
