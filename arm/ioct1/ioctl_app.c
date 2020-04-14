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
	printf("yes\n");
	unsigned int fd;
	int high = 1,low = 0;
	sleep(1);
	printf("1\n");

	fd = open("/dev/ioctl",O_RDWR);
	if(fd < 0)
	{
		perror("open");
		_exit(1);
	}
	printf("2\n");
	sleep(1);
	printf("3\n");
	sleep(1);
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
