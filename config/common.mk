# Copyright (C) 2018 Descendant
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

MAJOR_VER := One
MINOR_VER := Three
DESCENDANT_NAME := $(MAJOR_VER)Dot$(MINOR_VER)

#Custom Properties

PRODUCT_PROPERTY_OVERRIDES += \
	org.descendant.full_ver=$(DESCENDANT_NAME)

#Overlays

DEVICE_PACKAGE_OVERLAYS += vendor/descendant/overlays/common

PRODUCT_PACKAGES += \
	SettingsBlackTheme \
	SystemBlackTheme \
	SystemDarkTheme \
	SystemPurpleHaze \
	SystemBluette \
	Launcher3Over \
	DefaultQS \
	DefaultSettings \
	SquareQS \
	SquareSettings \
	SuperBubbleQS \
	SuperBubbleSettings \
	TeardropQS \
	TeardropSettings

# Default ringtone/alarm/notification sounds
PRODUCT_PROPERTY_OVERRIDES += \
    	ro.config.ringtone=Leaps_and_bounds.ogg \
    	ro.config.notification_sound=Coconuts.ogg \
    	ro.config.alarm_alert=Full_of_wonder.ogg

#Prebuilts
include vendor/descendant/prebuilt/pre.mk

#Include Changelog
PRODUCT_COPY_FILES += \
	vendor/descendant/GSI/Changelog.txt:system/etc/Changelog.txt

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

#Accents
PRODUCT_PACKAGES += \
    AmberAccent \
    BlackAccent \
    BlueAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    TealAccent \
    WhiteAccent

# whitelist packages for location providers not in system
PRODUCT_PROPERTY_OVERRIDES += \
    ro.services.whitelist.packagelist=com.google.android.gms
