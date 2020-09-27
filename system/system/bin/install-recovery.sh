#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:0eaed9fab3ac746427452ef813d1f5a07101b2d8; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:9443ceb58a80f5e7140d6947635a88163522b005 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:0eaed9fab3ac746427452ef813d1f5a07101b2d8 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
