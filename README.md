# Project Kokoro - integrate Magisk into your Android-x86 build (x86_64 only)

**Current Magisk branch : stable**

**Current Magisk version : 24.1** 

This project is aim to integrate Magisk into Android-x86 build automatically, and can even be able to use modules as well as Zygisk. It's mainly based on works like [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA) or [MagiskOnEmu](https://github.com/HuskyDG/MagiskOnEmu) so you will see they might be pretty similar.
Kokoro currently aiming to support Android-x86 builds that are Android 10+ with x86_64 only, so if you want x86 support you can contribute here, I don't have any interest to support it so far.

Note that the instruction is only for building the image, if you want to manually integrate into a prebuilts image (say like PrimeOS 2.0) you have to figure it out yourself.

## How to use
- It is recommend to clear everything related to koushSU, the old Superuser that Android-x86 usually use, you can try to remove external/koush folder (which includes [Superuser](https://git.osdn.net/view?p=android-x86/external-koush-Superuser.git;a=summary) and [Widget](https://git.osdn.net/view?p=android-x86/external-koush-Superuser.git;a=summary)) , also reverting the commit on Settings (for example, [here is my commit on ProjectSakura-x86](https://github.com/supremegamers/android_packages_apps_Settings/commit/4a4de015c8c7724bc9c222cc6c8f1a6dc4a013f1))
- Go to bootable/newinstaller and cherry-pick [this commit](https://github.com/supremegamers/bootable_newinstaller/commit/9ff32be219e65b08f3cbd2e20629e1df3dabe218) to patch sepolicy using magiskpolicy tool
- It is recommend to cherry-pick [this commit](https://github.com/supremegamers/bootable_newinstaller/commit/929245d5c46aa19ddab5de8cf153bf82b6adc16b) on bootable/newinstaller too so that if you extract system.sfs out to .img Magisk is still usable, but keep in mind that you will never be able to set system as R/W. 
- Go to device/generic/common and cherry-pick [this commit](https://github.com/supremegamers/device_generic_common/commit/2a37e98631fff756f933222b6586258f2897999e) so that the build will copy the files and also init.*.rc can recognize init.kokoro.rc
- When building, please export `ANDROID_INTEGRATE_MAGISK=true` so that the build will start copying the Magisk files in.

## How does it works
Well..... same as the 2 projects above, init.kokoro.rc will prepare a tmpfs folder (in this case `/dev/magisk`) and then putting all the Magisk files into it (the files are located in /system/etc/magisk), linking to the appropriate tools and then starting the Magisk boot stage like `post-fs-data`/`services`/`boot-complete` .

In order to prevent the magic mount to accidetally mount the whole drive to `/data` instead of the only data folder or image, I unmount the data in magic mount (if it does mount) and then linking the mount place to /data instead. Not only does it help magic mount to not accidentally mount the drive, but also helps the Magisk modules show and working properly.

After that, Magisk is completely initialized and you can use it.

## Origin of the name
The name `Kokoro` comes from [Hata no Kokoro](https://en.touhouwiki.net/wiki/Hata_no_Kokoro), a character from _Touhou Project_ , usually appears on fighting games in the series. Since her power is manipulating emotions by using the masks I decided to use them for this project. 

![Kokoro](https://en.touhouwiki.net/images/8/8d/Th155Kokoro.png)

_Kokoro art made by [Moe Harukawa](https://en.touhouwiki.net/wiki/Moe_Harukawa) used in the main series fighting games produced by [Tasofro](https://tasofro.net/) + [Team Shanghai Alice](https://www16.big.or.jp/~zun/)_

## Credit

The project is nothing without the work of these guys
- [John Wu](https://github.com/topjohnwu) and the contributors behind [Magisk](https://github.com/topjohnwu/Magisk).
- [LSPosed Team](https://github.com/LSPosed) with the work behind [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA)
- [HuskyDG](https://github.com/HuskyDG) for helping me setting up Magisk on Android-x86 so that I can complete make project.


## Good luck
