# 01 - Safe ADB collection (research-only)

This phase is read-only. Do **not** flash, wipe, format, or write partitions.

## Requirements

- ADB installed on host
- USB debugging enabled on owner device
- Device authorized for ADB

## Run

```bash
bash scripts/collect_adb_info.sh collection-output
```

## What is collected

- Non-secret build and platform properties (`getprop` subset)
- Partition and mount metadata readable from userspace
- Boot/recovery metadata when exposed by proc/sysfs
- Kernel and config information where readable
- Input/display/audio/camera/Wi-Fi/RIL capability indicators
- Package/build inventory information

## Privacy and safety

- Script excludes known sensitive property names (serial/IMEI/MAC/ICCID/IMSI/MSISDN)
- Script does not pull private app data
- Script performs no write/flash/reboot operations

Review generated files before sharing externally.
