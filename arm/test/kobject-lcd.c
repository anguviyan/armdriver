#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/slab.h>
#include <linux/gpio.h>
#include <linux/interrupt.h>
#include <linux/delay.h>

#define RS_COMMAND_MODE		0
#define RS_DATA_MODE		1

#define LCD_FIRST_LINE		1
#define LCD_SECOND_LINE		2

#define LCD_RS_PIN_NUMBER	7
#define LCD_E_PIN_NUMBER	63

#define LCD_DB4_PIN_NUMBER	82
#define LCD_DB5_PIN_NUMBER	83
#define LCD_DB6_PIN_NUMBER	105
#define LCD_DB7_PIN_NUMBER	106

static void lcd_instruction (char command);
static void lcd_data (char data);
static void lcd_initialize (void);
static void lcd_cursor_on (void);
static void lcd_cursor_off (void);
static void lcd_setLinePosition (unsigned int line);
static void lcd_setPosition (unsigned int line, unsigned int nthCharacter);
static void lcd_clearDisplay (void);
static void lcd_string (char *msg);

static struct gpio leds_gpios[] = {
  {LCD_RS_PIN_NUMBER, GPIOF_DIR_OUT, "GPIO0_7"},
  {LCD_E_PIN_NUMBER, GPIOF_DIR_OUT, "GPIO1_31"},
  {LCD_DB7_PIN_NUMBER, GPIOF_DIR_OUT, "GPIO2_18"},
  {LCD_DB6_PIN_NUMBER, GPIOF_DIR_OUT, "GPIO2_19"},
  {LCD_DB5_PIN_NUMBER, GPIOF_DIR_OUT, "GPIO3_9"},
  {LCD_DB4_PIN_NUMBER, GPIOF_DIR_OUT, "GPIO3_7"},
};

static void lcd_initialize (void)
{
  usleep_range (41 * 1000, 50 * 1000);

  lcd_instruction (0x30);
  usleep_range (5 * 1000, 6 * 1000);

  lcd_instruction (0x30);
  usleep_range (100, 200);

  lcd_instruction (0x30);
  usleep_range (100, 200);

  lcd_instruction (0x20);

  usleep_range (100, 200);

  lcd_instruction (0x20);
  lcd_instruction (0x80);

  usleep_range (41 * 1000, 50 * 1000);

  lcd_instruction (0x00);
  lcd_instruction (0x80);
  usleep_range (100, 200);

  lcd_instruction (0x00);
  lcd_instruction (0x10);
  usleep_range (100, 200);

  lcd_instruction (0x00);
  lcd_instruction (0x60);

  usleep_range (100, 200);

  lcd_instruction (0x00);
  lcd_instruction (0xF0);

  usleep_range (100, 200);
}

void lcd_setLinePosition (unsigned int line)
{
  if (line == 1)
    {
      lcd_instruction (0x80);
      lcd_instruction (0x00);
    }
  else if (line == 2)
    {
      lcd_instruction (0xC0);
      lcd_instruction (0x00);
    }
  else
    {
      printk ("ERR: Invalid line number. Select either 1 or 2 \n");
    }
}

void lcd_setPosition (unsigned int line, unsigned int nthCharacter)
{
  char command;

  if (line == 1)
    {
      command = 0x80 + (char) nthCharacter;

      lcd_instruction (command & 0xF0);
      lcd_instruction ((command & 0x0F) << 4);
    }
  else if (line == 2)
    {
      command = 0xC0 + (char) nthCharacter;

      lcd_instruction (command & 0xF0);
      lcd_instruction ((command & 0x0F) << 4);
    }
  else
    {
      printk ("ERR: Invalid line number. Select either 1 or 2 \n");
    }
}

static void lcd_clearDisplay (void)
{
  lcd_instruction (0x00);
  lcd_instruction (0x10);
  printk (KERN_INFO "klcd Driver: display clear\n");
}

static void lcd_cursor_on (void)
{
  lcd_instruction (0x00);
  lcd_instruction (0xF0);
  printk (KERN_INFO "klcd Driver: lcd_cursor_on\n");
}

static void lcd_cursor_off (void)
{
  lcd_instruction (0x00);
  lcd_instruction (0xC0);
  printk (KERN_INFO "klcd Driver: lcd_cursor_off\n");
}

static void lcd_display_off (void)
{
  lcd_instruction (0x00);
  lcd_instruction (0x80);
  printk (KERN_INFO "klcd Driver: lcd_display_off\n");
}

static void lcd_string (char *msg)
{
  while (*msg != '\0')
    {
      lcd_data (*msg);
      msg++;
    }
}


static void lcd_instruction (char command)
{
  int db7_data = 0;
  int db6_data = 0;
  int db5_data = 0;
  int db4_data = 0;

  usleep_range (2000, 3000);

  db7_data = ((command) & (0x1 << 7)) >> (7);
  db6_data = ((command) & (0x1 << 6)) >> (6);
  db5_data = ((command) & (0x1 << 5)) >> (5);
  db4_data = ((command) & (0x1 << 4)) >> (4);

  gpio_set_value (LCD_DB7_PIN_NUMBER, db7_data);
  gpio_set_value (LCD_DB6_PIN_NUMBER, db6_data);
  gpio_set_value (LCD_DB5_PIN_NUMBER, db5_data);
  gpio_set_value (LCD_DB4_PIN_NUMBER, db4_data);

  gpio_set_value (LCD_RS_PIN_NUMBER, RS_COMMAND_MODE);
  usleep_range (5, 10);

  gpio_set_value (LCD_E_PIN_NUMBER, 1);
  usleep_range (5, 10);
  gpio_set_value (LCD_E_PIN_NUMBER, 0);
}

static void lcd_data (char data)
{
  int db7_data = 0;
  int db6_data = 0;
  int db5_data = 0;
  int db4_data = 0;

  usleep_range (2000, 3000);

  db7_data = ((data) & (0x1 << 7)) >> (7);
  db6_data = ((data) & (0x1 << 6)) >> (6);
  db5_data = ((data) & (0x1 << 5)) >> (5);
  db4_data = ((data) & (0x1 << 4)) >> (4);

  gpio_set_value (LCD_DB7_PIN_NUMBER, db7_data);
  gpio_set_value (LCD_DB6_PIN_NUMBER, db6_data);
  gpio_set_value (LCD_DB5_PIN_NUMBER, db5_data);
  gpio_set_value (LCD_DB4_PIN_NUMBER, db4_data);

  gpio_set_value (LCD_RS_PIN_NUMBER, RS_DATA_MODE);
  usleep_range (5, 10);

  gpio_set_value (LCD_E_PIN_NUMBER, 1);
  usleep_range (5, 10);
  gpio_set_value (LCD_E_PIN_NUMBER, 0);

  usleep_range (2000, 3000);

  db7_data = ((data) & (0x1 << 3)) >> (3);
  db6_data = ((data) & (0x1 << 2)) >> (2);
  db5_data = ((data) & (0x1 << 1)) >> (1);
  db4_data = ((data) & (0x1));

  gpio_set_value (LCD_DB7_PIN_NUMBER, db7_data);
  gpio_set_value (LCD_DB6_PIN_NUMBER, db6_data);
  gpio_set_value (LCD_DB5_PIN_NUMBER, db5_data);
  gpio_set_value (LCD_DB4_PIN_NUMBER, db4_data);

  gpio_set_value (LCD_RS_PIN_NUMBER, RS_DATA_MODE);
  usleep_range (5, 10);

  gpio_set_value (LCD_E_PIN_NUMBER, 1);
  usleep_range (5, 10);
  gpio_set_value (LCD_E_PIN_NUMBER, 0);
}

enum lcdmodes {
	CURSOR_ON,CURSOR_OFF,DISPLAY_OFF,CLEARLCDDISPLAY_ON
};
static enum lcdmodes mode;

static ssize_t lcdsetlineposition_store (struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
  int value;
  sscanf(buf,"%i",&value);
  lcd_setLinePosition(value);
  return count;
}

static ssize_t lcdmode_show(struct kobject *kobj, struct kobj_attribute *attr,char *buf)
{
	switch(mode)
	{
		case CURSOR_ON:
			return sprintf(buf,"lcdcursor ON\n");
		case CURSOR_OFF:
			return sprintf(buf,"lcdcursor OFF\n");
		case DISPLAY_OFF:
			return sprintf(buf,"displayoff ON\n");
		case CLEARLCDDISPLAY_ON:
			return sprintf(buf,"lcdcleardisplay OFF\n");
		default:
			return sprintf(buf,"error in LKM\n");
	}
}

static ssize_t lcdmode_store (struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
	if(strncmp(buf,"cursor_on",count-1) == 0)
	{
		lcd_cursor_on ();
	}
	else if(strncmp(buf,"cursor_off",count-1) == 0)
	{
		lcd_cursor_off ();
	}
	else if(strncmp(buf,"display_off",count-1) == 0)
	{
		lcd_display_off ();
	}
	else if(strncmp(buf,"clearlcddisplay_on",count-1) == 0)
	{
		lcd_clearDisplay ();
	}

	return count;
}

static ssize_t lcdstring_store (struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
  char value;
  sscanf (buf, "%s", &value);
  lcd_string(&value);
  return count;
}

static ssize_t lcddata_store (struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
  char value;
  sscanf (buf, "%s", &value);
  lcd_data (value);
  return count;
}

static ssize_t lcdinstruction_store (struct kobject *kobj, struct kobj_attribute *attr,const char *buf, size_t count)
{
  unsigned value;
  sscanf (buf, "%i", &value);
  lcd_instruction(value);
  return count;
}

static struct kobj_attribute lcd_setlineposition_attribute = __ATTR_WO (lcdsetlineposition);
static struct kobj_attribute lcd_mode_attribute 	  = __ATTR(lcdmode, 0664, lcdmode_show, lcdmode_store);
static struct kobj_attribute lcd_string_attribute         = __ATTR_WO (lcdstring);
static struct kobj_attribute lcd_data_attribute           = __ATTR_WO (lcddata);
static struct kobj_attribute lcd_instruction_attribute    = __ATTR_WO (lcdinstruction);

static struct attribute *attrs[] = {
  &lcd_setlineposition_attribute.attr,
  &lcd_mode_attribute.attr,
  &lcd_string_attribute.attr,
  &lcd_data_attribute.attr,
  &lcd_instruction_attribute.attr,
  NULL,
};

static struct attribute_group attr_group = {
  .attrs = attrs,
};

static struct kobject *gpio_kobj;

static int __init start (void)
{
  int retval, err;

  gpio_kobj = kobject_create_and_add ("GPIO_EXAMPLE", kernel_kobj);
  if (!gpio_kobj)
    return -ENOMEM;

  retval = sysfs_create_group (gpio_kobj, &attr_group);
  if (retval)
    kobject_put (gpio_kobj);
  err = gpio_request_array (leds_gpios, ARRAY_SIZE (leds_gpios));
  if (err)
    {
      printk (KERN_ERR "This gpios is not enabled\n");
      return -EINVAL;
    }
  lcd_initialize ();
  lcd_string ("sriram");  
  return retval;
}

static void __exit stop (void)
{
  lcd_display_off ();
  lcd_cursor_off ();
  lcd_clearDisplay ();
  kobject_put (gpio_kobj);
  printk (KERN_INFO "This driver and gpio is removed from the kernel\n");
}

module_init (start);
module_exit (stop);

MODULE_LICENSE ("Dual BSD/GPL");
MODULE_VERSION ("V0.1");
MODULE_AUTHOR ("sriramdhivakar.M");
MODULE_DESCRIPTION ("This module is based on the kobject gpio");
