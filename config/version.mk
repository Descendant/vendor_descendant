# Copyright (C) 2016-2017 AOSiP
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

# Versioning System
PRODUCT_VERSION_MAJOR = Two
PRODUCT_VERSION_MINOR = One

DATE := $(shell date +%Y%m%d)
TARGET_PRODUCT_SHORT := $(subst descendant_,,$(DESCENDANT_BUILDTYPE))

DESCENDANT_BUILDTYPE ?= Alpha
DESCENDANT_BUILD_VERSION := $(PRODUCT_VERSION_MAJOR)Dot$(PRODUCT_VERSION_MINOR)
DESCENDANT_VERSION := $(DESCENDANT_BUILD_VERSION)-$(DESCENDANT_BUILDTYPE)-$(DESCENDANT_BUILD)-$(DATE)
ROM_FINGERPRINT := DESCENDANT/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.descendant.build.version=$(DESCENDANT_BUILD_VERSION) \
  ro.descendant.build.date=$(DATE) \
  ro.descendant.buildtype=$(DESCENDANT_BUILDTYPE) \
  ro.descendant.fingerprint=$(ROM_FINGERPRINT) \
  ro.descendant.version=$(DESCENDANT_VERSION) \
  ro.descendant.device=$(DESCENDANT_BUILD) \
  ro.modversion=$(DESCENDANT_VERSION)
