#!/usr/bin/env bash
# Small utility to replace `nix path-info --all`
set -euo pipefail

for file in /nix/store/*; do
  case "$file" in
  *.check)
    # Skip .check file produced by --keep-failed
    continue
    ;;
  *.lock)
    # Skip .lock files
    continue
    ;;
  *)
    echo "$file"
    ;;
  esac
done
