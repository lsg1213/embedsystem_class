#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>
#include <jni.h>
#include "font.h"
JNIEXPORT void JNICALL Java_edu_skku_memorygame_1fpgadotmatrix_1jni_fpgadotmatrixJNIDriver_DotMatrixControl(
		JNIEnv* env, jobject thiz, jstring str)
{
	const char *pStr;
	int fd, i, j, offset = 20, ch, len;
	char result[600], tmp[2], input[100];

	pStr = (*env)->GetStringUTFChars(env, str, 0);
	len = (*env)->GetStringLength(env, str);

	fd = open("/dev/sjl_fpga_dotmatrix", O_RDWR | O_SYNC);


	for (i = 0; i < len; i++) {
		ch = pStr[i];

		ch -= 0x20;

		for (j = 0; j < 5; j++) {
			sprintf(tmp, "%x%x", font[ch][j] / 16, font[ch][j] % 16);

			result[offset++] = tmp[0];
			result[offset++] = tmp[1];
		}
		result[offset++] = '0';
		result[offset++] = '0';
	}



	for (i = 0; i < (offset - 18) / 2; i++) {
		for (j = 0; j < 20; j++) {
			write(fd, &result[2 * i], 20);
		}
	}
	close(fd);

	(*env)->ReleaseStringUTFChars(env, str, pStr);
}
