#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/device.h>
#include <linux/slab.h>
#include <linux/sched.h>
#include <asm/current.h>
#include <linux/gpio.h>
#include <linux/uaccess.h>

#include "gpio_commands.h"

#define CHAR_NAME "ioctl"
#define MAX_SIZE 2048

static dev_t first;
static int minor = 0;
static int count = 1;
static struct cdev *mydev;
static struct class *cl;
static char *kbuf;
static int inuse = 0;
static unsigned int gpio;

static int open(struct inode *inode, struct file *filp)
{
	inuse++;
	printk(KERN_INFO"This module is open for these many times %d\n",inuse);
	printk(KERN_INFO"Majorno is %d,Minorno is %d\n",imajor(inode),iminor(inode));
	printk(KERN_INFO"Process name is %s,process id is %d,Process state is %ld\n",current->comm,current->pid,current->state);
	printk(KERN_INFO"The Refno = %d\n",module_refcount(THIS_MODULE));
	return 0;
}

static long ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
{
	unsigned int nbyte,m,n;

	
	switch(cmd)
	{
		case set_gpio_assign:	
			nbyte = copy_from_user(&n,(int*)arg,sizeof(int));
			gpio = n;
			if(!(gpio_is_valid(gpio)))
			{
				printk(KERN_ERR"This GPIO%d is not valid\n",gpio);
				return -EINVAL;
			}
			gpio_request(gpio,"sys");
			printk(KERN_INFO"This GPIO%d is valid\n",gpio);
			//gpio_direction_output(gpio,1);
			//gpio_set_value(gpio,1);
			break;
		case set_gpio_export:
			nbyte = copy_from_user(&n,(int*)arg,sizeof(int));
			if(nbyte < 0)
			{
				printk(KERN_ERR"The GPIO%d is not exported\n",gpio);
				return -EINVAL;
			}
			m = n;
			if(m == 0)
			{
				gpio_export(gpio,false);
			}
			else
			{
				gpio_export(gpio,true);
			}
			printk(KERN_INFO"The GPIO%d is exported\n",gpio);
			break;
		case set_gpio_direction:
			nbyte = copy_from_user(&n,(int*)arg,sizeof(int));
			if(nbyte < 0)
			{
				printk(KERN_ERR"The GPIO%d is not diected\n",gpio);
				return -EINVAL;
			}
			m = n;
			if(m == 0)
			{
				gpio_direction_output(gpio,0);
			}
			else
			{
				gpio_direction_output(gpio,1);
			}
			printk(KERN_INFO"The GPIO%d is directed to output\n",gpio);
			break;
		case set_gpio_value:
			nbyte = copy_from_user(&n,(int*)arg,sizeof(int));
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
		case set_gpio_unexport:
			nbyte = copy_from_user(&n,(in*)arg,sizeof(in));
			gpio = 

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
	kbuf = (char*)kzalloc(MAX_SIZE,GFP_KERNEL);
	printk(KERN_INFO"This device is register in the kernel with the name %s\n",CHAR_NAME);
	printk(KERN_INFO"Process name is %s,Process id is %d,Process state is %ld\n",current->comm,current->pid,current->state);
	printk(KERN_INFO"Majorno is %d,Minorno is %d\n",MAJOR(first),MINOR(first));
	return 0;
}

static void __exit stop(void)
{
	gpio_unexport(gpio);
	gpio_free(gpio);
	kfree(kbuf);
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
