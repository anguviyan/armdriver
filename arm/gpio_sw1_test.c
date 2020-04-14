#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/gpio.h>
#include <linux/interrupt.h>

static unsigned int sw   = 20;
static unsigned int sw1  = 7;
static unsigned int led  = 105;
static unsigned int led1 = 83;
static unsigned int irqnumber;
static unsigned int irqnumber1;
static int my_id   = 100;
static int my_id1  = 200;
static bool ledon  = false;
static bool ledon1 = false;
static int irqnum  = 0;
static int irqnum1 = 0;

static irqreturn_t led_interrupt(int irq,void *dev_id)
{
	ledon = !ledon;
	gpio_set_value(led,ledon);
	irqnum++;
	printk(KERN_INFO"The Button state is %d\n",gpio_get_value(sw));
	printk(KERN_INFO"The Button is pressed for these many times %d\n",irqnum);
	return IRQ_HANDLED;
}

static irqreturn_t led1_interrupt(int irq,void *dev_id)
{
	ledon1 = !ledon1;
	gpio_set_value(led1,ledon1);
	irqnum1++;
	printk(KERN_INFO"The Button state is %d\n",gpio_get_value(sw1));
	printk(KERN_INFO"The Button is pressed for these many times %d\n",irqnum1);
	return IRQ_HANDLED;
}

static int __init start(void)
{
	printk(KERN_INFO"GPIO: This is the gpio switch test\n");

	int result  = 0;
	int result1 = 0;

	if(!(gpio_is_valid(sw)))
	{
		printk(KERN_ERR"This Gpio is not valid\n");
		return -EINVAL;
	}
	gpio_request(sw,"sys");
	gpio_export(sw,true);
	gpio_direction_input(sw);
	
	if(!(gpio_is_valid(sw1)))
	{
		printk(KERN_ERR"This Gpio is not valid\n");
		return -EINVAL;
	}
	gpio_request(sw1,"sys");
	gpio_export(sw1,true);
	gpio_direction_input(sw1);
	
	if(!(gpio_is_valid(led)))
	{
		printk(KERN_ERR"This Gpio is not valid\n");
		return -EINVAL;
	}
	gpio_request(led,"sys");
	gpio_export(led,true);
	gpio_direction_output(led,0);
	
	if(!(gpio_is_valid(led1)))
	{
		printk(KERN_ERR"This Gpio is not valid\n");
		return -EINVAL;
	}
	gpio_request(led1,"sys");
	gpio_export(led1,true);
	gpio_direction_output(led1,0);

	gpio_set_debounce(sw,200);
	printk(KERN_INFO"The Button state is %d\n",gpio_get_value(sw));
	irqnumber = gpio_to_irq(sw);
	printk(KERN_INFO"This Button generate the irq of %d\n",irqnumber);
	result = request_irq(irqnumber,(irq_handler_t) led_interrupt,IRQF_TRIGGER_RISING,"My Led switch interrupt",&my_id);
	printk(KERN_INFO"The GPIO based request is %d\n",result);
	
	gpio_set_debounce(sw1,200);
	printk(KERN_INFO"The Button state is %d\n",gpio_get_value(sw1));
	irqnumber1 = gpio_to_irq(sw1);
	printk(KERN_INFO"This Button generate the irq of %d\n",irqnumber1);
	result1 = request_irq(irqnumber1,(irq_handler_t) led1_interrupt,IRQF_TRIGGER_RISING,"My Led switch interrupt",&my_id1);
	printk(KERN_INFO"The GPIO based request is %d\n",result1);

	return 0;
}

static void __exit stop(void)
{
	free_irq(irqnumber,&my_id);
	free_irq(irqnumber1,&my_id1);
	gpio_unexport(led);
	gpio_free(led);
	gpio_unexport(led1);
	gpio_free(led1);
	gpio_unexport(sw1);
	gpio_free(sw1);
	gpio_unexport(sw);
	gpio_free(sw);
	printk(KERN_INFO"This gpio is removed from the kernel\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_VERSION("V0.1");
MODULE_AUTHOR("sriramdhivakar.M");
MODULE_DESCRIPTION("This Gpio test for switch");
