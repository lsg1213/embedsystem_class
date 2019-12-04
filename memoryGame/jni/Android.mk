LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := sjl_jni
LOCAL_SRC_FILES := sjl_fpgalcd_jni.c sjl_fpgafullcolor_jni.c sjl_fpgadotmatrix_jni.c

include $(BUILD_SHARED_LIBRARY)
