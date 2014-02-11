ifeq ($(ENABLE_SENSOR_HUB),true)

LOCAL_PATH := $(call my-dir)

#
# sensorhubd - sensorhub daemon
#
include $(CLEAR_VARS)
LOCAL_MODULE := sensorhubd
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
    src/daemon/main.c \
    src/utils/utils.c
LOCAL_SHARED_LIBRARIES := liblog libhardware_legacy
include $(BUILD_EXECUTABLE)

#
# libsensorhub - sensorhub client library
#
include $(CLEAR_VARS)
LOCAL_MODULE := libsensorhub
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := \
    src/lib/libsensorhub.c \
    src/utils/utils.c
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/src/include
include $(BUILD_SHARED_LIBRARY)


#
# sensorhub_client - sensorhub test client
#
include $(CLEAR_VARS)
LOCAL_MODULE := sensorhub_client
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := src/tests/sensor_hub_client.c
LOCAL_SHARED_LIBRARIES := libsensorhub liblog
include $(BUILD_EXECUTABLE)

#
# test.c from Alek
#
include $(CLEAR_VARS)
LOCAL_MODULE := test_alek
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := src/tests/test.c
include $(BUILD_EXECUTABLE)

#
# bist_test.c
#
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := src/tests/bist_test.c
LOCAL_SHARED_LIBRARIES := libsensorhub
LOCAL_MODULE := bist_test
include $(BUILD_EXECUTABLE)

#
# compass calibration test.
#
include $(CLEAR_VARS)
LOCAL_MODULE := calibration
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := src/tests/calibration.c
LOCAL_SHARED_LIBRARIES := libsensorhub
include $(BUILD_EXECUTABLE)

#
# event notification test.
#
include $(CLEAR_VARS)
LOCAL_MODULE := event_notification
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := src/tests/event_notification.c
LOCAL_SHARED_LIBRARIES := libsensorhub liblog
include $(BUILD_EXECUTABLE)

endif
