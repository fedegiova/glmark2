LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CPP_EXTENSION := .cc
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/src/libmatrix
LOCAL_MODULE := matrix
LOCAL_CPPFLAGS := -DANDROID -DUSE_GLESv2
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src
LOCAL_SRC_FILES := src/libmatrix/mat.cc \
                   src/libmatrix/program.cc

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := png
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/src/libpng
LOCAL_SRC_FILES := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/libpng/*.c))

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := glmark2-android
LOCAL_STATIC_LIBRARIES := matrix png
LOCAL_CPPFLAGS := -DANDROID -DUSE_GLESv2 -DGLMARK_DATA_PATH=""
LOCAL_LDLIBS := -landroid -llog -lGLESv2 -lEGL -lz -lm
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src
LOCAL_SRC_FILES := $(filter-out src/canvas% src/main.cpp, \
                     $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/*.cpp))) \
                   src/canvas-android.cpp

include $(BUILD_SHARED_LIBRARY)
