#include <time.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <assert.h>

int main(void)
{
	int i, j;

	int fd;
	char nums[7];
	struct tm *tm_ptr;
	time_t the_time;

	fd = open("/dev/fpga_segment", O_WRONLY);
	assert(fd >= 0);

for (;;)
{
	for (i = 0; i < 20; ++i)
	{
		(void) time(&the_time);
		tm_ptr = localtime(&the_time);
		sprintf(nums, "%02d%02d%02d", tm_ptr->tm_hour, tm_ptr->tm_min, tm_ptr->tm_sec);

		write(fd, nums, 6);
	}
}

	close(fd);
	return 0;
}
