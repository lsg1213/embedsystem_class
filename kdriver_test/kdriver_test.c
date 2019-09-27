#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

#include <fcntl.h>

#define NODE_NAME "/dev/kdriver"		//  ����̹��� ����Ű�� ��ġ ��� ����

int main(int argc, char * argv[]) {
    int fd;

	fd = open(NODE_NAME, O_WRONLY); //  ��ġ ��� ���� ����, kdriver_open()ȣ��
	if(fd < 0) {
		printf("%s open error...\n", NODE_NAME);
		return -1;
	}

	write(fd, NULL, 0);		// ��ġ�� ����, kdriver_write() ȣ��
	ioctl(fd, 0, 0);			// mutex ����

	close(fd);			// ��ġ �ݱ�, kdriver_close() ȣ��

	exit(0);
}
