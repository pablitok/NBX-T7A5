#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="${1:-}"
OUT_DIR="${2:-./artifacts/manifest}"

if [[ -z "${SRC_DIR}" ]]; then
  echo "Usage: $0 <source-artifact-dir> [out-dir]" >&2
  exit 1
fi

if [[ ! -d "${SRC_DIR}" ]]; then
  echo "Source directory not found: ${SRC_DIR}" >&2
  exit 1
fi

mkdir -p "${OUT_DIR}"
MANIFEST="${OUT_DIR%/}/manifest.txt"

{
  echo "# Artifact manifest"
  echo "# Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "# Source: ${SRC_DIR}"
  echo
  find "${SRC_DIR}" -type f | sort | while read -r f; do
    sz="$(stat -c '%s' "$f")"
    hash="$(sha256sum "$f" | awk '{print $1}')"
    rel="${f#"${SRC_DIR}"/}"
    printf '%s  %s  %s\n' "$hash" "$sz" "$rel"
  done
} > "${MANIFEST}"

echo "Wrote ${MANIFEST}"
