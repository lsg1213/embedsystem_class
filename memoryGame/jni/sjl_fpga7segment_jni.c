#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <assert.h>
#include <jni.h>

static int fd;

JNIEXPORT void JNICALL Java_edu_skku_memorygame_1fpga7segment_1jni_fpga7segmentJNIDriver_open
  (JNIEnv * env, jobject obj){
	fd = open("/dev/sjl_fpga7segment", O_WRONLY);
	assert(fd != -1);
}

JNIEXPORT void JNICALL Java_edu_skku_memorygame_1fpga7segment_1jni_fpga7segmentJNIDriver_print
  (JNIEnv * env, jobject obj, jint num){
	char buf[7];
	sprintf(buf, "%06d", num);
	printf(stdout, "num: %s\n", num);
	write(fd, buf, 6);
}

JNIEXPORT void JNICALL Java_edu_skku_memorygame_1fpga7segment_1jni_fpga7segmentJNIDriver_close
  (JNIEnv * env, jobject obj){
	close(fd);
}

