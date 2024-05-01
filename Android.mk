#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),r8q)

subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))

$(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

NFC_CONFIG_SYMLINKS := $(TARGET_OUT_VENDOR)/etc
$(NFC_CONFIG_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating nfc config symlinks: $@"
	$(hide) ln -sf /mnt/vendor/etc/libnfc-nci.conf $@/libnfc-nci.conf

ALL_DEFAULT_INSTALLED_MODULES += \
    $(NFC_CONFIG_SYMLINKS)

endif
