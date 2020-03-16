#ifndef	_GPIO_COMMAND_H_
#define	_GPIO_COMMAND_H_

#include <asm/ioctl.h>

#define magic 'A'

#define set_gpio_assign		_IOW(magic,1,uint)
#define set_gpio_export		_IOW(magic,2,uint)
#define set_gpio_direction	_IOW(magic,3,uint)
#define set_gpio_value		_IOW(magic,4,uint)
#define set_gpio_unexport	_IOW(magic,5,uint)
#define set_gpio_free		_IOW(magic,6,uint)

#define max_gpio_cmd	6

#endif
