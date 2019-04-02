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
MINOR_VER := Two
DESCENDANT_NAME := $(MAJOR_VER)Dot$(MINOR_VER)

#Custom Properties

PRODUCT_PROPERTY_OVERRIDES += \
	org.descendant.full_ver=$(DESCENDANT_NAME)

#Overlays

DEVICE_PACKAGE_OVERLAYS += vendor/descendant/overlays/common

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

#Overrides
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.opa.eligible_device=true

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
