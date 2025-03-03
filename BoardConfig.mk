#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common
include device/samsung/universal9830-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/z3s

# Audio
BOARD_USE_BTA2DP_OFFLOAD := true
BOARD_USE_QUAD_MIC := true
# BOARD_USE_CAMCORDER_QUAD_MIC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/libbt_vndcfg.txt

# Camera
$(call soong_config_set,samsungCameraVars,usage_64bit,true)
SOONG_CONFIG_NAMESPACES += samsungCameraVars
SOONG_CONFIG_samsungCameraVars += extra_ids
# ID=52 is telephoto
SOONG_CONFIG_samsungCameraVars_extra_ids := 52

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
TARGET_KERNEL_CONFIG := exynos9830-z3sxxx_defconfig

# OTA
TARGET_OTA_ASSERT_DEVICE := z3s

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Wi-Fi
BOARD_WLAN_BCMDHD_SAE                         := true
BOARD_WLAN_DEVICE                             := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER                   := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB              := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER                          := NL80211
BOARD_HOSTAPD_PRIVATE_LIB                     := lib_driver_cmd_bcmdhd
CONFIG_IEEE80211AX                            := true
WIFI_AVOID_IFACE_RESET_MAC_CHANGE             := true
WIFI_FEATURE_HOSTAPD_11AX                     := true
WIFI_HIDL_FEATURE_AWARE                       := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE              := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION                        := VER_0_8_X

# inherit from the proprietary version
-include vendor/samsung/z3s/BoardConfigVendor.mk
