LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

BOARD_USE_ANDROID := true
BOARD_USE_SKYPE_HD := true

# Set to false to use Android's OMX header files
BOARD_USE_KHRONOS_OMX_HEADER := false

ifeq ($(BOARD_USE_ANDROID), false)
BOARD_USE_KHRONOS_OMX_HEADER := true
endif

EXYNOS_OMX_SUPPORT_TUNNELING := false
EXYNOS_OMX_SUPPORT_EGL_IMAGE := false

EXYNOS_OMX_TOP := $(LOCAL_PATH)

EXYNOS_OMX_INC := $(EXYNOS_OMX_TOP)/include
EXYNOS_OMX_COMPONENT := $(EXYNOS_OMX_TOP)/component

EXYNOS_VIDEO_CODEC := \
	$(EXYNOS_OMX_TOP)/../videocodec
ifeq ($(BOARD_USE_ALP_AUDIO), true)
    ifeq ($(BOARD_USE_SEIREN_AUDIO), true)
    EXYNOS_AUDIO_CODEC += \
        hardware/samsung_slsi-linaro/exynos/libseiren
    else
    EXYNOS_AUDIO_CODEC += \
        hardware/samsung_slsi-linaro/exynos/libsrp
    endif
endif

include $(EXYNOS_OMX_TOP)/osal/Android.mk
include $(EXYNOS_OMX_TOP)/core/Android.mk

include $(EXYNOS_OMX_COMPONENT)/common/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/dec/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/dec/h264/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/dec/hevc/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/dec/mpeg4/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/dec/vp8/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/dec/mpeg2/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/dec/vc1/Android.mk

include $(EXYNOS_OMX_COMPONENT)/video/enc/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/enc/h264/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/enc/mpeg4/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/enc/vp8/Android.mk

ifeq ($(BOARD_USE_HEVCENC_SUPPORT), true)
include $(EXYNOS_OMX_COMPONENT)/video/enc/hevc/Android.mk
endif
ifeq ($(BOARD_USE_VP9DEC_SUPPORT), true)
include $(EXYNOS_OMX_COMPONENT)/video/dec/vp9/Android.mk
endif
ifeq ($(BOARD_USE_VP9ENC_SUPPORT), true)
include $(EXYNOS_OMX_COMPONENT)/video/enc/vp9/Android.mk
endif
ifeq ($(BOARD_USE_WFDENC_SUPPORT), true)
include $(EXYNOS_OMX_COMPONENT)/video/enc/h264wfd/Android.mk
include $(EXYNOS_OMX_COMPONENT)/video/enc/hevcwfd/Android.mk
endif

ifeq ($(BOARD_USE_ALP_AUDIO), true)
    include $(EXYNOS_OMX_COMPONENT)/audio/common/Android.mk
    ifeq ($(BOARD_USE_SEIREN_AUDIO), true)
    include $(EXYNOS_OMX_COMPONENT)/audio/seiren_dec/Android.mk
    include $(EXYNOS_OMX_COMPONENT)/audio/seiren_dec/mp3/Android.mk
    include $(EXYNOS_OMX_COMPONENT)/audio/seiren_dec/aac/Android.mk
    include $(EXYNOS_OMX_COMPONENT)/audio/seiren_dec/flac/Android.mk
    else
    include $(EXYNOS_OMX_COMPONENT)/audio/dec/Android.mk
    include $(EXYNOS_OMX_COMPONENT)/audio/dec/mp3/Android.mk
    endif
endif

ifeq ($(BOARD_USE_WMA_CODEC), true)
include $(EXYNOS_OMX_COMPONENT)/audio/dec/wma/Android.mk
endif
