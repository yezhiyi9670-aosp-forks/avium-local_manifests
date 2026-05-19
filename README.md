Branch: `avium-16.2`

Personal branch: `avium-16.2-personal-build`  
Known working sync date:
- `2026-05-16 16:48:12+00:00`
- `2026-05-17 07:40:04+00:00`
- `2026-05-18 12:20:03+00:00`
- `2026-05-19 17:15:24+00:00`

To build the personal fork, drop `roomservice.xml` into `.repo/local_manifests` before doing `repo sync`.

Resources that you may need for building:

- Vanilla LineageOS: [Build for lemonades | LineageOS Wiki](https://wiki.lineageos.org/devices/lemonades/build/)
  
  - Configure your Ubuntu 24.04 environment according to this guide. Additionally install `erofs-utils` if needed to extract firmware from flashable zip.

- AviumUI: [AviumUI/android_manifests](https://github.com/AviumUI/android_manifests/blob/avium-16.2/README.mkdn)
  
  - Run the `repo init`, `repo sync` and `lunch`/`brunch` step according to this guide instead of Vanilla LineageOS guide)
  
  - Avoid using excessive number of jobs. During `repo init`, use no more than 8 to prevent 429 error. During `m bacon`, use no more than 18 on 64GB RAM to prevent OOM.

- Proprietary firmware could be extracted from builds provided by [Neokoni's OTA Center](https://ota.neokoni.ink/device/lemonades/AviumUI/avium-16), or possibly [Vanilla LineageOS builds](https://download.lineageos.org/devices/lemonades).
