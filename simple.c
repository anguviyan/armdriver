#include <linux/kernel.h>
#include <linux/module.h>

static int __init start(void)
{
	printk(KERN_INFO"****************************************sriram and angusamy**********************************************\n");
	return 0;
}

static void __exit stop(void)
{
	printk(KERN_INFO"*************************************************Bye*****************************************************\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_VERSION("V0.1");
MODULE_AUTHOR("sriramdhivakar.M");
MODULE_DESCRIPTION("This is the basic driver for ARM");
