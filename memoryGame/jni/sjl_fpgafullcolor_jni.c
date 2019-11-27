#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <jni.h>

#define FULL_LED1	9
#define	FULL_LED2	8
#define FULL_LED3	7
#define FULL_LED4	6
#define ALL_LED		5

int fd = 0;
JNIEXPORT jint JNICALL Java_edu_skku_memorygame_1fpgafullcolorled_1jnidriver_fpgafullcolorledJNIDriver_openDriver
(JNIEnv * env, jclass class, jstring path){
	jboolean iscopy;
	const char *path_utf = (*env)->GetStringUTFChars(env, path, &iscopy);
	fd = open(path_utf, O_WRONLY);
	(*env)->ReleaseStringUTFChars(env, path, path_utf);
	if (fd < 0)
		return -1;
	else
		return 1;
}

JNIEXPORT void
JNICALL Java_edu_skku_memorygame_1fpgafullcolorled_1jnidriver_fpgafullcolorledJNIDriver_closeDriver
(JNIEnv * env, jobject obj){
	if (fd > 0)
		close(fd);
}
int
Java_edu_skku_memorygame_1fpgafullcolorled_1jnidriver_fpgafullcolorledJNIDriver_FLEDControl(JNIEnv* env, jobject thiz, jint led_num, jint val1, jint val2, jint val3)
{
	int ret;
	char buf[3];

	if (fd < 0)
	{
		exit(-1);
	}
	ret = (int)led_num;
	switch(ret)
	{
		case FULL_LED1:
			ioctl(fd,FULL_LED1);
			break;
		case FULL_LED2:
			ioctl(fd,FULL_LED2);
			break;
		case FULL_LED3:
			ioctl(fd,FULL_LED3);
			break;
		case FULL_LED4:
			ioctl(fd,FULL_LED4);
			break;
		case ALL_LED:
			ioctl(fd,ALL_LED);
			break;
	}
	buf[0] = val1;
	buf[1] = val2;
	buf[2] = val3;

	write(fd,buf,3);

}
