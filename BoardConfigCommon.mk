#
# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from the proprietary version
-include vendor/lge/g3-common/BoardConfigVendor.mk

LOCAL_PATH := device/lge/g3-common

PRODUCT_VENDOR_KERNEL_HEADERS := device/lge/g3-common/kernel-headers

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=g3 user_debug=31 msm_rtb.filter=0x0 androidboot.bootdevice=msm_sdcc.1 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x0008000 --ramdisk_offset 0x2000000
TARGET_KERNEL_SOURCE := kernel/lge/g3

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_QTI_CAMERA_32BIT_ONLY := true
COMMON_GLOBAL_CFLAGS += -DLG_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND=' \
    { "persist.data.sensor_name", AID_CAMERA, 0 }, \
    { "camera.4k2k.enable", AID_MEDIA, 0 }, \
    { "persist.data.rear.minfps", AID_MEDIA, 0 }, \
    { "persist.data.front.minfps", AID_MEDIA, 0 }, \
    '

# CMHW
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/

# Display
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITION := true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

HAVE_ADRENO_SOURCE:= false
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_CHIPSET := pn547

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# GPS definitions for Qualcomm solution
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true

# Radio
BOARD_RIL_CLASS := ../../../device/lge/g3-common/ril/
TARGET_RELEASE_CPPFLAGS += -DNEEDS_LGE_RIL_SYMBOLS

# Time services
BOARD_USES_QC_TIME_SERVICES := true

BUILD_KERNEL := true
