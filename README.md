# NBX-T7A5

Safe, reproducible **research-first** workspace for a possible Android 7.1 bring-up on the Noblex NBX-T7A5 (Intel Sofia3GR family).

## Scope of this phase

This repository intentionally stops at **data collection and preparation**:

- No flashing
- No partition writes
- No bootloader operations
- No claims beyond verified evidence

If full device dumps and legally usable binaries are not available, a real port must not be started.

## Repository layout

- `scripts/collect_adb_info.sh` — reproducible non-secret ADB data collection
- `scripts/extract_and_hash_artifacts.sh` — safe artifact hashing and inventory
- `scripts/check_partition_sizes.sh` — compare image sizes against collected partition metadata
- `scripts/unpack_boot_recovery.sh` — read-only unpack helper for boot/recovery images
- `scripts/validate_artifacts.sh` — sanity checks for required preparation artifacts
- `docs/01-collection.md` — how to run collection safely
- `docs/02-firmware-acquisition.md` — legal/safe artifact acquisition and handling
- `docs/03-hardware-compatibility.md` — Sofia3GR Android 7.1 compatibility assessment and blockers
- `docs/04-bringup-skeleton.md` — initial bring-up skeleton notes
- `docs/05-risk-recovery.md` — concise risk and recovery guidance
- `device/noblex/nbx_t7a5/` — initial device-tree skeleton with TODO placeholders
- `vendor/noblex/nbx_t7a5/` — initial vendor skeleton (empty placeholders only)
- `kernel/noblex/sofia3gr/` — kernel-source placeholder notes
- `tests/validate_scripts.sh` — syntax and safety validation for scripts

## Quick start

1. Follow `docs/01-collection.md`
2. Place owner-provided images under `artifacts/` (gitignored by default)
3. Run:
   - `bash tests/validate_scripts.sh`
