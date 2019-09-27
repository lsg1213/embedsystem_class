#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

#include <fcntl.h>

#define NODE_NAME "/dev/kdriver"		//  드라이버를 가리키는 장치 노드 파일

int main(int argc, char * argv[]) {
    int fd;

	fd = open(NODE_NAME, O_WRONLY); //  장치 노드 파일 열기, kdriver_open()호출
	if(fd < 0) {
		printf("%s open error...\n", NODE_NAME);
		return -1;
	}

	write(fd, NULL, 0);		// 장치에 쓰기, kdriver_write() 호출
	ioctl(fd, 0, 0);			// mutex 해제

	close(fd);			// 장치 닫기, kdriver_close() 호출

	exit(0);
}
