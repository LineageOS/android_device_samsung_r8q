#
# Copyright (C) 2024 The LineageOS Project
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

DEVICE_PATH := device/samsung/r8q

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# call the common setup
$(call inherit-product, device/samsung/sm8250-common/common.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_platform_info_diff.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_diff.xml \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Init files
PRODUCT_PACKAGES += \
    init.r8q.rc \
    init.nfc.sh

# Disabled NFC inits
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/android.hardware.nfc@1.2-service.samsung.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.nfc@1.2-service.samsung.rc

# NFC configs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(DEVICE_PATH)/configs/nfc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp_RF.conf \
    $(DEVICE_PATH)/configs/nfc/libnfc-nci-NXP_SN100U.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci-NXP_SN100U.conf \

# Sensors
PRODUCT_PACKAGES += \
    sensors.r8q

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Inherit r8q blobs
$(call inherit-product, vendor/samsung/r8q/r8q-vendor.mk)
