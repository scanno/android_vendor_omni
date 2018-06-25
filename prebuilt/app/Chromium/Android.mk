ifneq ($(TARGET_USES_AOSP_BROWSER),true)
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := Chromium
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := APPS
#LOCAL_SRC_FILES    := 64bit/MonochromePublic.apk
# LOCAL_CERTIFICATE  := PRESIGNED
LOCAL_MODULE_PATH  := $(TARGET_OUT_APPS)
LOCAL_MULTILIB := both
LOCAL_CERTIFICATE := $(DEFAULT_SYSTEM_DEV_CERTIFICATE)
LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support

LOCAL_MODULE_TARGET_ARCH := arm arm64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := $(my_src_arch)/MonochromePublic.apk

LOCAL_PREBUILT_JNI_LIBS_arm := @lib/armeabi-v7a/libmonochrome.so
LOCAL_PREBUILT_JNI_LIBS_arm64 := @lib/arm64-v8a/libmonochrome.so

include $(BUILD_PREBUILT)
endif
