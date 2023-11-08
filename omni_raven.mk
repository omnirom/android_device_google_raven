#
# Copyright 2020 The Android Open-Source Project
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

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

DEVICE_PACKAGE_OVERLAYS += device/google/raven/overlay

TARGET_BOOTANIMATION_SIZE := 1080p

$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, device/google/gs101/device-omni.mk)
$(call inherit-product, device/google/raviole/aosp_raven.mk)

PRODUCT_NAME := omni_raven
PRODUCT_MODEL := Pixel 6 Pro
PRODUCT_BRAND := google

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=oriole \
    PRIVATE_BUILD_DESC="raven-user 14 UP1A.231005.007 10754064 release-keys"

# defined in vendor/google_devices/raven/proprietary/device-vendor.mk
BUILD_FINGERPRINT := google/raven/raven:14/UP1A.231005.007/10754064:user/release-keys

PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := false

# for bringup to disable secure adb - copy adbkey.pub from ~/.android
#PRODUCT_ADB_KEYS := device/google/raviole/adbkey.pub
#PRODUCT_PACKAGES += \
    adb_keys

#BOARD_BOOTCONFIG += androidboot.selinux=permissive
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# HBM
PRODUCT_COPY_FILES += \
    device/google/raviole/permissions/permissions_com.android.hbmsvmanager.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/permissions_com.android.hbmsvmanager.xml

# euicc from stock
PRODUCT_COPY_FILES += \
    device/google/raviole/permissions/permissions_com.google.android.euicc.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/permissions_com.google.android.euicc.xml

# For Google Camera
PRODUCT_COPY_FILES += \
    device/google/raviole/the_experiences.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/the_experiences.xml

# wireless_charger HAL service
include device/google/gs-common/wireless_charger/wireless_charger.mk
