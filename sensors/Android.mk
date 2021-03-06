LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    sensors.cpp \
    SensorBase.cpp \
    LightSensor.cpp \
    ProximitySensor.cpp \
    CompassSensor.cpp \
    Accelerometer.cpp \
    Gyroscope.cpp \
    InputEventReader.cpp \
    CalibrationManager.cpp \
    NativeSensorManager.cpp \
    VirtualSensor.cpp \
    sensors_XML.cpp

LOCAL_CFLAGS += \
    -DLOG_TAG=\"Sensors\" \
    -Wno-format \
    -Wno-unused-private-field \
    -Wno-unused-variable

LOCAL_C_INCLUDES := \
    external/libxml2/include \
    external/icu/icu4c/source/common

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_SHARED_LIBRARIES := liblog libcutils libdl libxml2 libutils
LOCAL_HEADER_LIBRARIES := calibration_headers

LOCAL_MODULE := sensors.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libcalmodule_common

LOCAL_CFLAGS := \
    -Wno-unused-variable

LOCAL_SRC_FILES := \
    algo/common/common_wrapper.c \
    algo/common/compass/AKFS_AOC.c \
    algo/common/compass/AKFS_Device.c \
    algo/common/compass/AKFS_Direction.c \
    algo/common/compass/AKFS_VNorm.c

LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := calmodule.cfg
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)
LOCAL_SRC_FILES := calmodule.cfg

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := calibration_headers
LOCAL_EXPORT_C_INCLUDE := \
    CalibrationModule.h \
    sensors_extension.h \
    sensors.h
include $(BUILD_HEADER_LIBRARY)
