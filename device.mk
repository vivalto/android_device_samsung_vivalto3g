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

LOCAL_PATH := device/samsung/vivalto3gvn

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/vivalto-common/vivalto-common-vendor.mk)

# overrlay import
#DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay       #currently disabled arent where we improve this to ride up

# This device is hdpi.  However the platform doesn't
# currently contain all of the bitmaps at hdpi density so
# we do this little trick to fall back to the mdpi version
# if the hdpi doesn't exist.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_AAPT_CONFIG := normal mdpi hdpi xhdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# languages
PRODUCT_LOCALES := en_US fr_FR it_IT es_ES de_DE nl_NL cs_CZ pl_PL ja_JP zh_TW zh_CN ru_RU ko_KR nb_NO es_US da_DK el_GR tr_TR pt_PT pt_BR rm_CH sv_SE bg_BG ca_ES en_GB fi_FI hi_IN hr_HR hu_HU in_ID iw_IL lt_LT lv_LV ro_RO sk_SK sl_SI sr_RS uk_UA vi_VN tl_PH ar_EG fa_IR th_TH sw_TZ ms_MY af_ZA zu_ZA am_ET hi_IN

PRODUCT_LOCALES += hdpi

$(call inherit-product, build/target/product/full.mk)

# Init files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/init.scx15_ss.rc:root/init.scx15_ss.rc \
	$(LOCAL_PATH)/rootdir/init.vivalto3gvn.rc:root/init.vivalto3gvn.rc \
	$(LOCAL_PATH)/rootdir/init.vivalto3gvn_base.rc:root/init.vivalto3gvn_base.rc \
	$(LOCAL_PATH)/rootdir/init.wifi.rc:root/init.wifi.rc \
	$(LOCAL_PATH)/rootdir/fstab.scx15:root/fstab.scx15 \
	$(LOCAL_PATH)/rootdir/init.board.rc:root/init.board.rc \
	$(LOCAL_PATH)/rootdir/init.scx15.rc:root/init.scx15.rc \
	$(LOCAL_PATH)/rootdir/init.scx15.usb.rc:root/init.scx15.usb.rc \
	$(LOCAL_PATH)/rootdir/ueventd.scx15.rc:root/ueventd.scx15.rc \
        $(LOCAL_PATH)/rootdir/init.recovery.scx15.rc:root/init.recovery.scx15.rc

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/rootdir/etc/extra.fstab:recovery/root/etc/extra.fstab

# Override phone-hdpi-512-dalvik-heap to match value on stock
# - helps pass CTS com.squareup.okhttp.internal.spdy.Spdy3Test#tooLargeDataFrame)
# (property override must come before included property)
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=56m \

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_vivalto3gvn
PRODUCT_DEVICE := vivalto3gvn
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G313HZ
