#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

int main(void)
{
	int fd;

	fd = open("/dev/fpga_led", O_WRONLY);
	assert(fd != -1);

for (;;)	// infinite loop
{
	unsigned char ch;
	int value;

	fprintf(stdout, "Input LED value [0-255] : ");
	fscanf(stdin, "%d", &value);

	ch = (unsigned char) value;
	write(fd, &ch, 1);
}
	close(fd);
	return 0;
}
