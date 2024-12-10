/*
 * Copyright (C) 2021-2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/logging.h>
#include <android-base/properties.h>
#include <libinit_utils.h>

#include <libinit_variant.h>

using android::base::GetProperty;

#define EM_MODEL_PROP "ro.boot.em.model"

void search_variant(const std::vector<variant_info_t> variants) {
    std::string em_model_prop = GetProperty(EM_MODEL_PROP, "");

    for (const auto& variant : variants) {
        if ((variant.model == "" || variant.model == em_model_prop)) {
            set_variant_props(variant);
            break;
        }
    }
}

void set_variant_props(const variant_info_t variant) {
    set_ro_build_prop("device", variant.device, true);
    set_ro_build_prop("model", variant.model, true);

    if (access("/system/bin/recovery", F_OK) != 0) {
        property_override("ro.bootimage.build.fingerprint", variant.build_fingerprint);
        property_override("ro.build.description", variant.build_desc);
    }
}