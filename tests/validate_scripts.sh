#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

scripts=(
  "${REPO_ROOT}/scripts/collect_adb_info.sh"
  "${REPO_ROOT}/scripts/extract_and_hash_artifacts.sh"
  "${REPO_ROOT}/scripts/check_partition_sizes.sh"
  "${REPO_ROOT}/scripts/unpack_boot_recovery.sh"
  "${REPO_ROOT}/scripts/validate_artifacts.sh"
)

for s in "${scripts[@]}"; do
  bash -n "$s"
done

# Ensure no script includes disallowed flashing commands.
if grep -R -E '\b(fastboot\s+flash|dd\s+if=.*of=/dev|mkfs\.|format\s+/)\b' "${REPO_ROOT}/scripts"; then
  echo "Disallowed potentially destructive command found." >&2
  exit 1
fi

if command -v shellcheck >/dev/null 2>&1; then
  shellcheck "${scripts[@]}"
else
  echo "shellcheck not installed; skipped (syntax checks completed)."
fi

echo "Script validation passed."
