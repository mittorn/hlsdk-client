# SoHL android makefile
# Copyright (c) mittorn



LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := server

include $(XASH3D_CONFIG)

LOCAL_CFLAGS += -D_LINUX -DCLIENT_WEAPONS \
	-Dstricmp=strcasecmp -Dstrnicmp=strncasecmp -D_snprintf=snprintf \
	-fno-exceptions -fsigned-char -Wno-write-strings -w -fpermissive -D_strnicmp=strncasecmp
	
LOCAL_C_INCLUDES := $(LOCAL_PATH)/. \
		    $(LOCAL_PATH)/../common \
		    $(LOCAL_PATH)/../engine/common \
		    $(LOCAL_PATH)/../engine \
		    $(LOCAL_PATH)/../public \
		    $(LOCAL_PATH)/../pm_shared \
		    $(LOCAL_PATH)/../game_shared

LOCAL_SRC_FILES := airtank.cpp animating.cpp animation.cpp bmodels.cpp botcam.cpp bot_combat.cpp bot.cpp buttons.cpp cbase.cpp client.cpp combat.cpp crossbow.cpp crowbar.cpp doors.cpp effects.cpp egon.cpp explode.cpp func_break.cpp func_tank.cpp game.cpp gamerules.cpp gauss.cpp ggrenade.cpp globals.cpp h_ai.cpp handgrenade.cpp h_battery.cpp h_cycler.cpp healthkit.cpp h_export.cpp hornet.cpp hornetgun.cpp items.cpp lights.cpp maprules.cpp mortar.cpp mp5.cpp mpstubb.cpp multiplay_gamerules.cpp pathcorner.cpp plane.cpp plats.cpp player.cpp python.cpp rpg.cpp satchel.cpp shotgun.cpp singleplay_gamerules.cpp skill.cpp sound.cpp soundent.cpp spectator.cpp squeakgrenade.cpp subs.cpp teamplay_gamerules.cpp triggers.cpp tripmine.cpp util.cpp weapons.cpp world.cpp xen.cpp \
	   ../pm_shared/pm_debug.c ../pm_shared/pm_math.c ../pm_shared/pm_shared.c \
	   ../game_shared/voice_gamemgr.cpp


ifeq ($(TARGET_ARCH_ABI),armeabi-v7a-hard)
LOCAL_MODULE_FILENAME = libserver_hardfp
endif

LOCAL_CPPFLAGS := $(LOCAL_CFLAGS) -frtti -fpermissive

include $(BUILD_SHARED_LIBRARY)
