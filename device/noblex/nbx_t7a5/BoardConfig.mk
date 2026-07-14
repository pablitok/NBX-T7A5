# Verified only from current research statement:
# - x86 userspace
# - 600x1024 panel
# - 1 GB RAM class

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86
TARGET_CPU_ABI := x86

# TODO(verified-dump-required): replace placeholder values using stock boot/recovery dump analysis.
BOARD_BOOTIMAGE_PARTITION_SIZE := 0
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0
BOARD_CACHEIMAGE_PARTITION_SIZE := 0
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0

TARGET_SCREEN_WIDTH := 600
TARGET_SCREEN_HEIGHT := 1024
