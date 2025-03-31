#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/samsung/sm8250-common',
    'vendor/qcom/opensource/display',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/lib64/hw/com.qti.chi.override.so': blob_fixup()
        .sig_replace('A0 06 40 F9 6D 66 00 94 80 01 00 34 A2 EA FF D0 43 EC FF 90 65 EB FF F0 E6 03 00 2A', '1F 20 03 D5 1F 20 03 D5 1F 20 03 D5 1F 20 03 D5 1F 20 03 D5 1F 20 03 D5 1F 20 03 D5')
        .sig_replace('42 50 3D 91 63 3C 13 91 A5 74 31 91 E4 0E 80 52 E0 03 1F 2A 21 00 80 52 65 D8 FF 97 A0 06 40 F9', '1F 20 03 D5 1F 20 03 D5 1F 20 03 D5 1F 20 03 D5 1F 20 03 D5 1F 20 03 D5 1F 20 03 D5 A0 06 40 F9'),
}  # fmt: skip

module = ExtractUtilsModule(
    'r8q',
    'samsung',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sm8250-common', module.vendor
    )
    utils.run()
