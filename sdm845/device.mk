#
# Copyright (C) 2011 The Android Open-Source Project
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

PRODUCT_SOONG_NAMESPACES += \
    device/generic/sdm845

# copied from crosshatch
# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Allow to override ramdisk until we can produce fully generic builds
RAMDISK_FSTAB_TARGET ?= $(LOCAL_PATH)/fstab.ramdisk

PRODUCT_COPY_FILES := \
    $(RAMDISK_FSTAB_TARGET):$(TARGET_COPY_OUT_RAMDISK)/fstab.sdm845 \
    $(RAMDISK_FSTAB_TARGET):$(TARGET_COPY_OUT_VENDOR)/etc/fstab.sdm845 \
    device/generic/sdm845/init.common.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.sdm845.rc \
    device/generic/sdm845/init.common.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.sdm845.usb.rc \
    device/generic/sdm845/common.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sdm845.kl

# Build generic Audio HAL
PRODUCT_PACKAGES := audio.primary.sdm845

# Build generic lights HAL
PRODUCT_PACKAGES += lights.sdm845

PRODUCT_PACKAGES += \
    pd-mapper \
    qrtr-ns \
    qrtr-cfg \
    qrtr-lookup \
    rmtfs \
    tqftpserv

PRODUCT_COPY_FILES += \
    device/generic/sdm845/qcom/init.qcom.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.qcom.rc
