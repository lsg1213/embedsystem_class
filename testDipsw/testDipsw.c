#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <assert.h>

int main(void)
{
	int fd;
	fd = open("/dev/fpga_dipsw", O_RDONLY);
	assert(fd != 0);

for (;;)
{
	unsigned short int value;

	read(fd, &value, 2);

	fprintf(stdout, "value : 0x%04x\n", value);
	sleep(1);
}
	close(fd);
	return 0;
}
