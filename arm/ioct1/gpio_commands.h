#ifndef	_GPIO_COMMAND_H_
#define	_GPIO_COMMAND_H_

#include <asm/ioctl.h>

#define magic 'A'

#define set_gpio_value		_IOW(magic,1,uint)

#define max_gpio_cmd	1

#endif
