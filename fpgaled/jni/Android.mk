LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := fpgaled_JNIDriver
LOCAL_SRC_FILES := fpgaled_JNIDriver.c

include $(BUILD_SHARED_LIBRARY)
