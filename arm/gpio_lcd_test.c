#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/gpio.h>
#include <linux/delay.h>

#define RS_COMMAND_MODE		0   
#define RS_DATA_MODE		1   

#define LCD_FIRST_LINE		1
#define LCD_SECOND_LINE		2

#define LCD_RS_PIN_NUMBER	83  
#define LCD_E_PIN_NUMBER	7   

#define LCD_DB4_PIN_NUMBER	20  
#define LCD_DB5_PIN_NUMBER	82  
#define LCD_DB6_PIN_NUMBER	106 
#define LCD_DB7_PIN_NUMBER	105 

static void lcd_instruction(char command);
static void lcd_data(char data);
static void lcd_initialize(void);
static void lcd_cursor_on(void);
static void lcd_cursor_off(void);
static void lcd_setLinePosition(unsigned int line);
static void lcd_setPosition(unsigned int line, unsigned int nthCharacter);
static void lcd_clearDisplay(void);
static void lcd_string(char *msg);

static struct gpio leds_gpios[] = {
	{LCD_DB7_PIN_NUMBER,GPIOF_DIR_OUT,"GPIO3_9"},
	{LCD_DB6_PIN_NUMBER,GPIOF_DIR_OUT,"GPIO3_10"},
	{LCD_DB5_PIN_NUMBER,GPIOF_DIR_OUT,"GPIO2_18"},
	{LCD_DB4_PIN_NUMBER,GPIOF_DIR_OUT,"PIO0_20"},
	{LCD_RS_PIN_NUMBER,GPIOF_DIR_OUT,"PIO2_19"},
	{LCD_E_PIN_NUMBER,GPIOF_DIR_OUT,"PIO0_7"},
};

static void lcd_initialize(void)
{
	usleep_range(41*1000, 50*1000);	

	lcd_instruction(0x30);		
	usleep_range(5*1000, 6*1000);

	lcd_instruction(0x30);		
	usleep_range(100,200);		

	lcd_instruction(0x30);	
	usleep_range(100,200);	

	lcd_instruction(0x20); 

	usleep_range(100,200);		

	lcd_instruction(0x20);		
	lcd_instruction(0x80);	
					
 	usleep_range(41*1000,50*1000);
					
	lcd_instruction(0x00);		
	lcd_instruction(0x80);		
	usleep_range(100,200);
					
	lcd_instruction(0x00);		
	lcd_instruction(0x10);		
	usleep_range(100,200);
					
	lcd_instruction(0x00);		
	lcd_instruction(0x60);		
					   
	usleep_range(100,200);
					
	lcd_instruction(0x00);		
	lcd_instruction(0xF0);		 
					
	usleep_range(100,200);
}

void lcd_setLinePosition(unsigned int line)
{
	if(line == 1){
		lcd_instruction(0x80);	
		lcd_instruction(0x00);
	}
	else if(line == 2){
		lcd_instruction(0xC0);
		lcd_instruction(0x00);
	}
	else{
		printk("ERR: Invalid line number. Select either 1 or 2 \n");
	}
}

void lcd_setPosition(unsigned int line, unsigned int nthCharacter)
{
	char command;

	if(line == 1){
		command = 0x80 + (char) nthCharacter;
				
		lcd_instruction(  command & 0xF0 ); 	 
		lcd_instruction( (command & 0x0F) << 4 );  
	}
	else if(line == 2){
		command = 0xC0 + (char) nthCharacter;

		lcd_instruction(  command & 0xF0 ); 	  
		lcd_instruction( (command & 0x0F) << 4 ); 
	}
	else{
		printk("ERR: Invalid line number. Select either 1 or 2 \n");
	}	
}

static void lcd_clearDisplay(void)
{
	lcd_instruction( 0x00 ); 
	lcd_instruction( 0x10 ); 
	printk(KERN_INFO "klcd Driver: display clear\n");
}

static void lcd_cursor_on(void)
{
	lcd_instruction(0x00);		
	lcd_instruction(0xF0);		  
	printk(KERN_INFO "klcd Driver: lcd_cursor_on\n");
}

static void lcd_cursor_off(void)
{
	lcd_instruction(0x00);		
	lcd_instruction(0xC0);		  
	printk(KERN_INFO "klcd Driver: lcd_cursor_off\n");
}

static void lcd_display_off(void)
{
	lcd_instruction(0x00);	
	lcd_instruction(0x80);	  
	printk(KERN_INFO "klcd Driver: lcd_display_off\n");
}

static void lcd_string(char *msg)
{
	while(*msg != '\0')
	{
		lcd_data(*msg);
		msg++;
	}
}

static void lcd_instruction(char command)
{
	int db7_data = 0;
	int db6_data = 0;
	int db5_data = 0;
	int db4_data = 0;

	usleep_range(2000, 3000);

	db7_data = ( (command)&(0x1 << 7) ) >> (7) ;
	db6_data = ( (command)&(0x1 << 6) ) >> (6) ;
	db5_data = ( (command)&(0x1 << 5) ) >> (5) ;
	db4_data = ( (command)&(0x1 << 4) ) >> (4) ;

	gpio_set_value(LCD_DB7_PIN_NUMBER, db7_data);
	gpio_set_value(LCD_DB6_PIN_NUMBER, db6_data);
	gpio_set_value(LCD_DB5_PIN_NUMBER, db5_data);
	gpio_set_value(LCD_DB4_PIN_NUMBER, db4_data);

	gpio_set_value(LCD_RS_PIN_NUMBER, RS_COMMAND_MODE);
	usleep_range(5, 10);

	gpio_set_value(LCD_E_PIN_NUMBER, 1);
	usleep_range(5, 10);
	gpio_set_value(LCD_E_PIN_NUMBER, 0);
}	
				
static void lcd_data(char data)
{
	int db7_data = 0;
	int db6_data = 0;
	int db5_data = 0;
	int db4_data = 0;

	usleep_range(2000, 3000); 	

	db7_data = ( (data)&(0x1 << 7) ) >> (7) ;
	db6_data = ( (data)&(0x1 << 6) ) >> (6) ;
	db5_data = ( (data)&(0x1 << 5) ) >> (5) ;
	db4_data = ( (data)&(0x1 << 4) ) >> (4) ;

	gpio_set_value(LCD_DB7_PIN_NUMBER, db7_data);
	gpio_set_value(LCD_DB6_PIN_NUMBER, db6_data);
	gpio_set_value(LCD_DB5_PIN_NUMBER, db5_data);
	gpio_set_value(LCD_DB4_PIN_NUMBER, db4_data);

	gpio_set_value(LCD_RS_PIN_NUMBER, RS_DATA_MODE);
	usleep_range(5, 10);

	gpio_set_value(LCD_E_PIN_NUMBER, 1);
	usleep_range(5, 10);
	gpio_set_value(LCD_E_PIN_NUMBER, 0);

	usleep_range(2000, 3000);	

	db7_data = ( (data)&(0x1 << 3) ) >> (3) ;
	db6_data = ( (data)&(0x1 << 2) ) >> (2) ;
	db5_data = ( (data)&(0x1 << 1) ) >> (1) ;
	db4_data = ( (data)&(0x1)      )        ;

	gpio_set_value(LCD_DB7_PIN_NUMBER, db7_data);
	gpio_set_value(LCD_DB6_PIN_NUMBER, db6_data);
	gpio_set_value(LCD_DB5_PIN_NUMBER, db5_data);
	gpio_set_value(LCD_DB4_PIN_NUMBER, db4_data);

	gpio_set_value(LCD_RS_PIN_NUMBER, RS_DATA_MODE);
	usleep_range(5, 10);
	
	gpio_set_value(LCD_E_PIN_NUMBER, 1);
	usleep_range(5, 10);
	gpio_set_value(LCD_E_PIN_NUMBER, 0);
}

static int __init start(void)
{
	int err;
	err = gpio_request_array(leds_gpios, ARRAY_SIZE(leds_gpios));
	if(err)
	{
		printk(KERN_ERR"This driver is not enable the gpio's\n");
		return -EINVAL;
	}
	lcd_initialize();
	lcd_setLinePosition(LCD_FIRST_LINE);
	lcd_cursor_on();
	lcd_string("sriram");
	return 0;
}

static void __exit stop(void)
{
	lcd_display_off();
	lcd_cursor_off();
	lcd_clearDisplay();
	gpio_free_array(leds_gpios, ARRAY_SIZE(leds_gpios));
	printk(KERN_INFO"The gpio is release from the kernel\n");
}

module_init(start);
module_exit(stop);

MODULE_LICENSE("Dual BSD/GPL");
MODULE_VERSION("V0.1");
MODULE_AUTHOR("sriramdhivakar.M");
MODULE_DESCRIPTION("This module is based on the 16x2 LCD");
