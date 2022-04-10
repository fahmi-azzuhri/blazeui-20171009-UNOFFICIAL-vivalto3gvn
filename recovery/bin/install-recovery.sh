#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7741440 2f8ecde13548149400cf254345e248c4be25256b 5529600 2f9fca1d2bd016f2be29cf8bad6a629714721216
fi

if ! applypatch -c EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY:7741440:2f8ecde13548149400cf254345e248c4be25256b; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sprd-sdhci.3/by-name/KERNEL:5529600:2f9fca1d2bd016f2be29cf8bad6a629714721216 EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY 2f8ecde13548149400cf254345e248c4be25256b 7741440 2f9fca1d2bd016f2be29cf8bad6a629714721216:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
