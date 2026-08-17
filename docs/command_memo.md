For memo only. Do not try if you don't know what you are doing.

Sync:
```bash
date -u --rfc-3339=seconds && repo sync -c -j4 --force-sync --no-clone-bundle --no-tags
```

Git fsck:
```bash
for dir in $(repo list | cut -d ':' -f 1); do echo "# $dir" && (cd "$dir" && git fsck --full); done >fsck.log 2>&1
```

Breakfast:
```bash
breakfast lemonades
```

Lunch:
```bash
lunch lineage_lemonades-bp4a-userdebug
```

Make:
```bash
m bacon
```

Make and flash now:
```bash
m bacon && ( adb reboot sideload-auto-reboot; adb wait-for-sideload && adb sideload out/target/product/lemonades/lineage_lemonades-ota.zip )
```

Make snapshot manifest:
```bash
repo manifest -r -o snapshot.xml
```

Release build one-liner:
```bash
. build/envsetup.sh && breakfast lemonades && lunch lineage_lemonades-bp4a-userdebug && m installclean && m bacon
```

Make proprietary blobs archive:
```bash
(
    filename=$(pwd)/blobs-$(date -u +"%Y%m%d").7z;
    [[ -f "$filename" ]] && rm "$filename";
    (cd vendor/oneplus/sm8250-common/proprietary && 7z a "$filename" .) &&
    (cd vendor/oneplus/lemonades/proprietary && 7z a "$filename" .)
)
```

Extract blobs 7z:
```bash
7z x blobs-20260720.7z -o"out/blob_dump"
```
