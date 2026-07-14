# 03 - Sofia3GR Android 7.1 compatibility assessment (initial)

## Verified baseline (from issue statement)

- Device: Noblex NBX-T7A5 tablet
- Platform family: Intel Sofia3GR
- Current OS baseline: Android 6.0.1
- Display: 600x1024
- RAM: 1 GB
- Userspace ABI: x86
- Modem capability: 3G-class cellular present

## Assessment for Android 7.1 (research phase only)

A potential 7.1 port is **not startable yet** without full dump artifacts and kernel/vendor evidence.

### Main blockers

1. **Kernel source/status unknown** for this exact board revision and Android 7.1 compatibility.
2. **Boot image details unknown** (base, cmdline, offsets, dt usage, ramdisk layout).
3. **Proprietary vendor blobs unavailable** (graphics/media/radio/camera/audio stacks).
4. **RIL integration unknown** for Sofia3GR modem stack on N.
5. **SELinux policy baseline missing** from stock dumps.
6. **Partition sizing constraints** not yet verified against prospective system/vendor images.
7. **Recovery path not validated** for safe rollback testing.

## Practical implication

Continue only with reproducible collection, artifact validation, and metadata analysis until owner-provided dumps are available and legally usable.
