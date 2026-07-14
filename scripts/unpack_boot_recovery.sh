#!/usr/bin/env bash
set -euo pipefail

IMG_PATH="${1:-}"
OUT_DIR="${2:-./out/unpacked}"

if [[ -z "${IMG_PATH}" ]]; then
  echo "Usage: $0 <boot-or-recovery-image> [out-dir]" >&2
  exit 1
fi

if [[ ! -f "${IMG_PATH}" ]]; then
  echo "Image not found: ${IMG_PATH}" >&2
  exit 1
fi

mkdir -p "${OUT_DIR}"

if command -v unpackbootimg >/dev/null 2>&1; then
  unpackbootimg -i "${IMG_PATH}" -o "${OUT_DIR}"
  echo "Unpacked with unpackbootimg into ${OUT_DIR}"
  exit 0
fi

if command -v magiskboot >/dev/null 2>&1; then
  cp "${IMG_PATH}" "${OUT_DIR}/image.img"
  (
    cd "${OUT_DIR}"
    magiskboot unpack image.img
  )
  echo "Unpacked with magiskboot into ${OUT_DIR}"
  exit 0
fi

echo "No unpack tool found (need unpackbootimg or magiskboot)." >&2
exit 1
