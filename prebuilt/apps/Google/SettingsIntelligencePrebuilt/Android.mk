
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := SettingsIntelligencePrebuilt
LOCAL_MODULE_OWNER := Google
LOCAL_SRC_FILES := SettingsIntelligencePrebuilt.apk
LOCAL_CERTIFICATE := shared
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := SettingsIntelligence
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

