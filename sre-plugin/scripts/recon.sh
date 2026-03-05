#!/bin/bash
TARGET="${1:?Usage: recon.sh <target>}"

echo "[recon] Target: ${TARGET}"
echo "[recon] $(date -u)"

# Add your tooling here, e.g.:
# nmap -sV "$TARGET"
# curl -sI "https://${TARGET}"
# nuclei -u "$TARGET"

echo "[recon] Done."
