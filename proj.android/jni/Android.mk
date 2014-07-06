LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := HelloEgret
LOCAL_SRC_FILES := HelloEgret.cpp


LOCAL_CPPFLAGS := -std=c++11 -pthread -frtti -fexceptions

				   
LOCAL_LDLIBS    := -llog -landroid -lGLESv2 -ljnigraphics -lz
LOCAL_EXPORT_LDLIBS := -lGLESv2 \
                       -llog \
                       -lz \
                       -landroid\
                       -ljnigraphics
                       
LOCAL_WHOLE_STATIC_LIBRARIES := spidermonkey_static\
								freetype2_static\
								png_static\
								curl_static\
								EgretFrameworkNative

include $(BUILD_SHARED_LIBRARY)


$(call import-add-path,$(LOCAL_PATH)/..)
$(call import-add-path,$(LOCAL_PATH)/../..)

$(call import-module,egret_libs/android)
$(call import-module,thirdparty/spidermonkey/prebuilt/android)
$(call import-module,thirdparty/freetype2/prebuilt/android)
$(call import-module,thirdparty/png/prebuilt/android)
$(call import-module,thirdparty/curl/prebuilt/android)