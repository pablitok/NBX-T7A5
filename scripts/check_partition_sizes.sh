#!/usr/bin/env bash
set -euo pipefail

PARTITIONS_FILE="${1:-}"
MANIFEST_FILE="${2:-}"

if [[ -z "${PARTITIONS_FILE}" || -z "${MANIFEST_FILE}" ]]; then
  echo "Usage: $0 <partitions-metadata.txt> <artifact-manifest.txt>" >&2
  exit 1
fi

if [[ ! -f "${PARTITIONS_FILE}" || ! -f "${MANIFEST_FILE}" ]]; then
  echo "Input file missing" >&2
  exit 1
fi

echo "Partition size check (best effort):"
echo "- Partitions source: ${PARTITIONS_FILE}"
echo "- Manifest source: ${MANIFEST_FILE}"

# Heuristic threshold: values with at least this many digits are treated as plausible
# partition capacities in bytes/blocks to avoid matching tiny unrelated numbers.
MIN_CAPACITY_DIGITS=7

# This is intentionally conservative: report candidate mismatches if both names and numeric sizes are parseable.
awk -v min_digits="${MIN_CAPACITY_DIGITS}" '
  FNR==NR {
    # manifest format: <sha256> <size> <path>
    if ($2 ~ /^[0-9]+$/) {
      file=$3
      gsub(/^.*\//, "", file)
      gsub(/\.img$/, "", file)
      msize[file]=$2
    }
    next
  }
  {
    line=tolower($0)
    for (k in msize) {
      if (index(line, k) > 0) {
        # look for first decimal number with min_digits as potential bytes/blocks
        n=""
        for (i=1; i<=NF; i++) {
          if ($i ~ ("^[0-9]{" min_digits ",}$")) { n=$i; break }
        }
        if (n != "" && msize[k] > n) {
          printf("WARN: image %s (%s bytes) may exceed listed capacity (%s)\n", k, msize[k], n)
        }
      }
    }
  }
' "${MANIFEST_FILE}" "${PARTITIONS_FILE}"

echo "Done. Review warnings manually due to format variability across dumps."
