#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/gpio.h>
	
static struct gpio leds[] = {
		{105,GPIOF_OUT_INIT_HIGH,"GPIO105"},
		{82,GPIOF_OUT_INIT_HIGH,"GPIO82"},
		{83,GPIOF_OUT_INIT_HIGH,"GPIO83"},
};

static int __init start(void)
{
	int err;

	err = gpio_request_array(leds,ARRAY_SIZE(leds));
	if(err)
	{
		printk(KERN_ERR"This GPIO is not register in the kernel\n");
		return -EINVAL;
	}
	return 0;
}

static void __exit stop(void)
{
	gpio_free_array(leds , ARRAY_SIZE(leds));
	printk(KERN_INFO"This GPIO is removed from the kernel\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_AUTHOR("sriramdhiavkar.M");
MODULE_VERSION("V0.1");
MODULE_DESCRIPTION("This module is based on the gpio test of new method");
