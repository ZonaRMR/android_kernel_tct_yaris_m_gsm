LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(BUILD_MTK_LDVT),true)
    LOCAL_CFLAGS += -DUSING_MTK_LDVT
endif

#LOCAL_SRC_FILES += \
#    asd_hal_base.cpp \
#    asd/asd_hal.cpp \
  
LOCAL_C_INCLUDES:= \
	 $(TOP)/$(MTK_PATH_CUSTOM)/hal/inc \
	 $(TOP)/$(MTK_PATH_SOURCE)/hardware/camera/inc \
   $(TOP)/$(MTK_PATH_SOURCE)/hardware/camera/inc/drv \
	 $(TOP)/$(MTK_PATH_PLATFORM)/hardware/camera/core/featureio/pipe/asd/asd \
	 $(TOP)/$(MTK_PATH_PLATFORM)/hardware/camera/inc \
	 $(TOP)/$(MTK_PATH_PLATFORM)/hardware/camera/inc/common \
	 $(TOP)/$(MTK_PATH_PLATFORM)/hardware/camera/inc/algorithm/libasd \
	 $(TOP)/$(MTK_PATH_PLATFORM)/hardware/camera/inc/featureio \

PLATFORM_VERSION_MAJOR := $(word 1,$(subst .,$(space),$(PLATFORM_VERSION)))
LOCAL_CFLAGS += -DPLATFORM_VERSION_MAJOR=$(PLATFORM_VERSION_MAJOR)

LOCAL_STATIC_LIBRARIES := \

LOCAL_WHOLE_STATIC_LIBRARIES := \

LOCAL_MODULE := libfeatureiopipe_asd

include $(BUILD_STATIC_LIBRARY)
