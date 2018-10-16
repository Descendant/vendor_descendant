LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := Launcher3Over
LOCAL_MODULE_OWNER := Descendant
LOCAL_SRC_FILES := descendant-launcher3-overlay.apk
LOCAL_CERTIFICATE := shared
LOCAL_MODULE_PATH := $(TARGET_OUT)/priv-app
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_PRIVILEGED_MODULE := true
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)
