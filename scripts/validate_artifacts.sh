#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="${1:-./artifacts}"
MANIFEST="${BASE_DIR%/}/manifest/manifest.txt"

if [[ ! -f "${MANIFEST}" ]]; then
  echo "Missing manifest: ${MANIFEST}" >&2
  exit 1
fi

awk '
  BEGIN { ok=1 }
  /^#/ || NF==0 { next }
  {
    hash=$1; size=$2; path=$3
    if (length(hash) != 64) {
      printf("Invalid hash length for %s\n", path)
      ok=0
    }
    if (size !~ /^[0-9]+$/) {
      printf("Invalid size for %s\n", path)
      ok=0
    }
  }
  END { exit(ok?0:1) }
' "${MANIFEST}"

echo "Artifact manifest format validated: ${MANIFEST}"
