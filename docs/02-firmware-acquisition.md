# 02 - Firmware and redistributable artifacts

## Allowed in this repository

- Hash manifests (SHA-256) of images
- Text logs from read-only diagnostics
- Manually provided files that are explicitly legal to redistribute

## Not allowed by default

- Private keys/certificates
- Wi-Fi credentials, APN credentials, account data
- Device serial numbers and modem identifiers
- Proprietary binaries unless owner explicitly supplies redistribution rights

## Acquisition guidance

Owner should gather stock packages from official or authorized channels and place them locally in:

- `/home/runner/work/NBX-T7A5/NBX-T7A5/artifacts/stock/`

Then run:

```bash
bash /home/runner/work/NBX-T7A5/NBX-T7A5/scripts/extract_and_hash_artifacts.sh \
  /home/runner/work/NBX-T7A5/NBX-T7A5/artifacts/stock \
  /home/runner/work/NBX-T7A5/NBX-T7A5/artifacts/manifest
```

Commit only manifest text/metadata that is safe and legally shareable.
