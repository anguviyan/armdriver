#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/sched.h>
#include <asm/current.h>
#include <linux/gpio.h>
#include <linux/uaccess.h>

#include "gpio_commands.h"

#define CHAR_NAME "ioctl"

static dev_t first;
static int minor = 0;
static int count = 1;
static struct cdev *mydev;
static struct class *cl;
static int inuse = 0;
static unsigned int gpio = 105;

static int open(struct inode *inode, struct file *filp)
{
	inuse++;
	printk(KERN_INFO"This module is open for these many times %d\n",inuse);
	return 0;
}

static long ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
{
	unsigned int nbyte,m,n;
        printk(KERN_INFO"111\n");
	switch(cmd)
	{
		case set_gpio_value:
			nbyte = copy_from_user(&n,(uint*)arg,sizeof(uint));
			m = n;
			if(nbyte < 0)
			{
				printk(KERN_ERR"The GPIO%d is not provided\n",gpio);
				return -EINVAL;
			}
			if(m == 0)
			{
				gpio_set_value(gpio,0);
			}else
			{
				gpio_set_value(gpio,1);
			}
			printk(KERN_INFO"The GPIO%d value is %d\n",gpio,m);
			break;
	}
		return 0;
}

static int close(struct inode *inode, struct file *filp)
{
	printk(KERN_INFO"This module is ejected from the kernel\n");
	return 0;
}

static struct file_operations f_ops = {
	.owner		=	THIS_MODULE,
	.open		=	open,
	.unlocked_ioctl	=	ioctl,
	.release	=	close,
};

static int __init start(void)
{
	if(alloc_chrdev_region(&first,minor,count,CHAR_NAME) < 0)
	{
		printk(KERN_ERR"This module is not register in the kernel\n");
		return -EINVAL;
	}
	mydev = cdev_alloc();
	cdev_init(mydev,&f_ops);
	if(cdev_add(mydev,first,count) < 0)
	{
		printk(KERN_INFO"This module is not register in the kernel\n");
		return -EINVAL;
	}
	cl = class_create(THIS_MODULE,"My_Gpio");
	device_create(cl,NULL,first,NULL,"%s",CHAR_NAME);
	if(!(gpio_is_valid(gpio)))
	{
		printk(KERN_ERR"This gpio is not valid\n");
		return -EINVAL;
	}
	gpio_request(gpio,"led");
	gpio_export(gpio,true);
	gpio_direction_output(gpio,1);
	gpio_set_value(gpio,0);
	printk(KERN_INFO"This device is register in the kernel with the name %s\n",CHAR_NAME);
	printk(KERN_INFO"/***********************************ioctl*******************************************/ \n");
	return 0;
}

static void __exit stop(void)
{
	gpio_unexport(gpio);
	gpio_free(gpio);
	device_destroy(cl,first);
	class_destroy(cl);
	cdev_del(mydev);
	unregister_chrdev_region(first,count);
	printk(KERN_INFO"This module is removed from the kernel\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_VERSION("V0.1");
MODULE_AUTHOR("sriramdhivakar.M");
MODULE_DESCRIPTION("This module is based on IOCTL programs");
