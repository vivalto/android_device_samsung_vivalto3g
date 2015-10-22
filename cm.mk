## Specify phone tech before including full_phone	
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := vivalto3gvn

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/full_vivalto3gvn.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := vivalto3gvn
PRODUCT_NAME := cm_vivalto3gvn
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G313HZ
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=samsung/vivalto3gvndx/vivalto3gvn:4.4.2/KOT49H/G313HZDBU0AOD1:user/release-keys PRIVATE_BUILD_DESC="vivalto3gvndx-user 4.4.2 KOT49H G313HZDBU0AOD1 release-keys"
