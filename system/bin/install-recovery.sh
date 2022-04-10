#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7376896 1dd73c68349ff75ed5e3b3a7a6ec6845d5f5b304 5163008 2ed4c1b76062d019ed9723f930b8d351bc60f93b
fi

if ! applypatch -c EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY:7376896:1dd73c68349ff75ed5e3b3a7a6ec6845d5f5b304; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sprd-sdhci.3/by-name/KERNEL:5163008:2ed4c1b76062d019ed9723f930b8d351bc60f93b EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY 1dd73c68349ff75ed5e3b3a7a6ec6845d5f5b304 7376896 2ed4c1b76062d019ed9723f930b8d351bc60f93b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
