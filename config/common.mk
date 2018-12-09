# Copyright (C) 2019 Descendant
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#Device Codename

DESCENDANT_DEVICE := $(subst descendant_,,$(TARGET_PRODUCT))

#Build Type

#ifndef BUILDTYPE
#    BUILDTYPE := UNOFFICIAL
#else
#    BUILDTYPE := OFFICIAL
#endif

#Versioning

MAJOR_VER := Two
MINOR_VER := One
DESCENDANT_NAME := $(MAJOR_VER)Dot$(MINOR_VER)

#Custom Properties

PRODUCT_PROPERTY_OVERRIDES += \
	org.descendant.full_ver=$(DESCENDANT_NAME)

#Overlays

DEVICE_PACKAGE_OVERLAYS += vendor/descendant/overlays/common

# Default ringtone/alarm/notification sounds
PRODUCT_PROPERTY_OVERRIDES += \
    	ro.config.ringtone=Leaps_and_bounds.ogg \
    	ro.config.notification_sound=Coconuts.ogg \
    	ro.config.alarm_alert=Full_of_wonder.ogg

#Prebuilts
include vendor/descendant/prebuilt/pre.mk

#Custom doze
PRODUCT_PACKAGES += \
    CustomDoze

#Weather client
PRODUCT_PACKAGES += \
    WeatherClient

#Fonts
PRODUCT_COPY_FILES += \
    vendor/descendant/fonts/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Regular.ttf \
    vendor/descendant/fonts/GoogleSans-Medium.ttf:system/fonts/GoogleSans-Medium.ttf \
    vendor/descendant/fonts/GoogleSans-MediumItalic.ttf:system/fonts/GoogleSans-MediumItalic.ttf \
    vendor/descendant/fonts/GoogleSans-Italic.ttf:system/fonts/GoogleSans-Italic.ttf \
    vendor/descendant/fonts/GoogleSans-Bold.ttf:system/fonts/GoogleSans-Bold.ttf \
    vendor/descendant/fonts/GoogleSans-BoldItalic.ttf:system/fonts/GoogleSans-BoldItalic.ttf

#Pixel Sysconfig
PRODUCT_COPY_FILES += \
     vendor/descendant/prebuilts/configs/pixel.xml:system/etc/sysconfig/pixel.xml

# whitelist packages for location providers not in system
PRODUCT_PROPERTY_OVERRIDES += \
    ro.services.whitelist.packagelist=com.google.android.gms

#Build themes 
include vendor/themes/common.mk

#Build sounds
include vendor/sounds/sounds.mk

#Include custom init
PRODUCT_COPY_FILES += \
    vendor/descendant/prebuilt/etc/init.descendant.rc:system/etc/init/init.descendant.rc

PRODUCT_BUILD_WPROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.build.selinux=1
