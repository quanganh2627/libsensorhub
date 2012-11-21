LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := psh.bin
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

ifeq ($(strip $(BOARD_USE_SENSOR_HUB)),true)

include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SHARED_LIBRARIES := libcutils
LOCAL_SRC_FILES :=libsensorhub.c
LOCAL_MODULE :=libsensorhub
LOCAL_MODULE_TAGS := optional
LOCAL_COPY_HEADERS_TO := libsensorhub
LOCAL_COPY_HEADERS := libsensorhub.h
# LOCAL_MODULE_TAGS := debug
include $(BUILD_SHARED_LIBRARY)
ALL_PREBUILT += $(copy_to)

endif
