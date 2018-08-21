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

ifndef BUILDTYPE
    BUILDTYPE := UNOFFICIAL
else
    BUILDTYPE := OFFICIAL
endif

#Versioning

MAJOR_VER := One
MINOR_VER := Zero
DESCENDANT_NAME := Descendant-$(MAJOR_VER)dot$(MINOR_VER)_$(BUILDTYPE)

#Custom Properties

CUSTOM_PROPERTIES := \
org.descendant.full_ver=$(DESCENDANT_NAME)

#Overlays

DEVICE_PACKAGE_OVERLAYS += vendor/descendant/overlay/common

#Prebuilts
include vendor/descendant/prebuilts/pre.mk
