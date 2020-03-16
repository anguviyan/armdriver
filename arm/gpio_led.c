#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/gpio.h>

static unsigned int led = 105;


static int __init start(void)
{
	printk(KERN_INFO"GPIO Test: GPIO is exported\n");
	if(!(gpio_is_valid(led)))
	{
		printk(KERN_ERR"This GPIO is not valid\n");
		return -EINVAL;
	}
	gpio_request(led,"sys");
	gpio_export(led,true);//"true for make direction API visiable"
	gpio_direction_output(led,1);
	gpio_set_value(led,1);
	return 0;
}

static void __exit stop(void)
{
	gpio_set_value(led,0);
	gpio_unexport(led);
	gpio_free(led);
	printk(KERN_INFO"This GPIO is unexported\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_VERSION("V0.1");
MODULE_AUTHOR("sriramdhivakar.M");
MODULE_DESCRIPTION("This module is based on ARM GPIO programming");
