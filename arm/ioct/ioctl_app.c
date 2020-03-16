#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <unistd.h>

#include "gpio_commands.h"

int main(void)
{
	int fd,exp = 1,dir = 1,high = 1,low = 0;
	int gpio = 105,io;

	fd = open("/dev/ioctl",O_RDWR);
	if(fd < 0)
	{
		perror("open");
		_exit(1);
	}

	ioctl(fd,set_gpio_assign,&gpio);
	ioctl(fd,set_gpio_export,&exp);
	ioctl(fd,set_gpio_direction,&dir);
	while(1)
	{
		ioctl(fd,set_gpio_value,&high);
		sleep(1);
		ioctl(fd,set_gpio_value,&low);
		sleep(1);
	}

	close(fd);

	_exit(0);
}
