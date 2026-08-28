#!/bin/bash
# DO NOT TRY IF YOU DO NOT FULLY UNDERSTANT CONTENTS OF THIS FILE

set -e
set -o pipefail

if [ -z "$1" ]; then
	echo "Usage: $0 <ota_file>" >&2
	exit 1
else
	echo "OTA file: $1"
fi
MICROG_FILE=addons/microG-Installer-20260517-121824-FDD-v0.3.15.zip
echo "MicroG file: $MICROG_FILE"
MAGISK_FILE=addons/Magisk-v30.7.apk
echo "Magisk file: $MAGISK_FILE"

echo "FOR UPDATING ONLY. NEVER USE FOR FIRST CUSTOM ROM INSTALL."
echo "ALSO DO NOT TRY IF YOU DO NOT FULLY UNDERSTANT CONTENTS OF THIS SCRIPT."
read -p "Press any key to start or Ctrl+C to abort..." -n1 -s
echo ""

echo "======== Flash recovery ========"
echo "Reboot to bootloader manually if your device does not do this automatically."
adb -d reboot bootloader || true
fastboot flash vbmeta vbmeta.img
fastboot flash dtbo dtbo.img
fastboot flash recovery recovery.img
fastboot reboot recovery

echo "======== Sideload OTA ========"
echo "Now choose to Apply Update from ADB Sideloading."
adb -d wait-for-sideload
echo "Please manually REBOOT to recovery and enter Sideload again when OTA is finished."
adb -d sideload "$1"
sleep 5

echo "======== Sideload MicroG ========"
adb -d wait-for-sideload
echo "Please manually enter Sideload again when installation is finished."
adb -d sideload "$MICROG_FILE"
sleep 5

echo "======== Sideload Magisk ========"
adb -d wait-for-sideload
echo "Please manually reboot to system again when installation is finished."
adb -d sideload "$MAGISK_FILE"
sleep 5

echo "======== Done ========"
echo "Please manually reboot to system."

read -p "Press any key to close..." -n1 -s
echo ""
