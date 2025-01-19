#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

function lib_to_package_fixup_vendor_variants() {
    if [ "$2" != "vendor" ]; then
        return 1
    fi

    case "$1" in
        libsecril-client | \
            libwpa_client) ;;
        *)
            return 1
            ;;
    esac
}

function lib_to_package_fixup() {
    lib_to_package_fixup_clang_rt_ubsan_standalone "$1" ||
        lib_to_package_fixup_proto_3_9_1 "$1" ||
        lib_to_package_fixup_vendor_variants "$@"
}

export DEVICE=r8q
export DEVICE_COMMON=sm8250-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
