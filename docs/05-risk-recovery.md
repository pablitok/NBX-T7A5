# 05 - Risk and recovery (concise)

## Risks during research

- Accidental disclosure of sensitive device identifiers
- Misclassification of proprietary files as redistributable
- Incorrect assumptions about partition layout or boot format

## Mitigations

- Read-only commands only
- Hash and inventory artifacts before any engineering decisions
- Redact and review logs prior to publication
- Keep all uncertain values as TODOs until verified

## Recovery posture

- Maintain untouched stock images provided by owner
- Keep integrity hashes for all source artifacts
- Do not perform flash operations in this phase
- If uncertain, stop and request additional verified data
