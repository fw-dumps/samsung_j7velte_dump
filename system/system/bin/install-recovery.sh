#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:25880592:3578099e2957af848518dbc6faa32b34aba6a9c3; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13540000.dwmmc0/by-name/BOOT:19644432:bb1c646b7da43b2c3c1d966fd8f50b2262c1590b \
          --target EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:25880592:3578099e2957af848518dbc6faa32b34aba6a9c3 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
