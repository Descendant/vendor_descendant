LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_RRO_THEME := SettingsBlackTheme
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := SettingsBlackTheme
LOCAL_SDK_VERSION := current
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := false
LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_IS_RUNTIME_RESOURCE_OVERLAY := true
include $(BUILD_PACKAGE)
