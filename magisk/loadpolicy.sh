#!/system/bin/sh
restorecon -R /data/adb/magisk
for module in \$(ls /data/adb/modules); do
if ! [ -f "/data/adb/modules/\$module/disable" ] && [ -f "/data/adb/modules/\$module/sepolicy.rule" ]; then
	/dev/magisk/magiskpolicy --live --apply "/data/adb/modules/\$module/sepolicy.rule"
	fi
    done