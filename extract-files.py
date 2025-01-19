#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/samsung/sm8250-common',
    'vendor/qcom/opensource/display',
]


lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'libsecril-client',
        'libwpa_client',
    ): lib_fixup_remove,
}

module = ExtractUtilsModule(
    'r8q',
    'samsung',
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sm8250-common', module.vendor
    )
    utils.run()
