#
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

#APKs
PRODUCT_PACKAGES += \
	BraveBrowser \
	CameraRoll \
	Markup \
	RetroMusicPlayer \
	SoundPickerPrebuilt \
	CalculatorPre \
	OpenCamera \
	AmazeFileManager


#APKs libs
PRODUCT_COPY_FILES += \
	vendor/descendant/prebuilt/libs/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
        vendor/descendant/prebuilt/libs/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

#Bootanimation
PRODUCT_COPY_FILES += \
	vendor/descendant/prebuilt/media/bootanimation/bootanimation.zip:system/media/bootanimation.zip

#Confs
PRODUCT_COPY_FILES += \
	vendor/descendant/prebuilt/configs/pixel.xml:system/etc/sysconfig/pixel.xml

# Turbo
PRODUCT_PACKAGES += \
        Turbo \
        turbo.xml \
        privapp-permissions-turbo.xml
