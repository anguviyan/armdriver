#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/gpio.h>

static int __init start(void)
{
	int err;
	err = gpio_request_one(105,GPIOF_OUT_INIT_HIGH,"GPIO105");
	if(err)
	{
		printk(KERN_ERR"This GPIO is not valid\n");
		return -EINVAL;
	}
	return 0;
}

static void __exit stop(void)
{
	gpio_unexport(105);
	gpio_free(105);
	printk(KERN_INFO"This GPIO is unexported\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_VERSION("V0.1");
