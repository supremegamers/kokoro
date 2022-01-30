#!/system/bin/sh

	if [ ! -d /data/adb/magisk/addon.d.sh ]; then
    cp /system/etc/magisk/addon.d.sh /data/adb/magisk/addon.d.sh
	fi
	if [ ! -d /data/adb/magisk/boot_patch.sh ]; then
    cp /system/etc/magisk/boot_patch.sh /data/adb/magisk/addon.d.sh
	fi
	if [ ! -d /data/adb/magisk/bootctl ]; then
    cp  /system/etc/magisk/bootctl /data/adb/magisk/bootctl
	fi
	if [ ! -d /data/adb/magisk/main.jar ]; then
    cp  /system/etc/magisk/main.jar /data/adb/magisk/main.jar
	fi
	if [ ! -d /data/adb/magisk/uninstaller.sh ]; then
    cp  /system/etc/magisk/uninstaller.jar /data/adb/magisk/uninstaller.jar
	fi
	if [ ! -d /data/adb/magisk/util_functions.sh ]; then
    cp  /system/etc/magisk/util_functions.jar /data/adb/magisk/util_functions.jar
	fi

    symlink /system/etc/magisk/magisk64 /data/adb/magisk/magisk64
    symlink /system/etc/magisk/magisk32 /data/adb/magisk/magisk32
    symlink /system/etc/magisk/busybox /data/adb/magisk/busybox
    symlink /system/etc/magisk/magiskboot /data/adb/magisk/magiskboot
    symlink /system/etc/magisk/magiskinit /data/adb/magisk/magiskinit