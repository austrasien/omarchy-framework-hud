#!/usr/bin/env bash
# Adds and enables the three plugins from their own repositories.
set -euo pipefail
command -v omarchy >/dev/null || { echo "omarchy not found: this is for an Omarchy machine." >&2; exit 1; }
for repo in omarchy-daytape omarchy-daybar omarchy-dayline; do
  echo "→ $repo"
  omarchy plugin add "https://github.com/austrasien/$repo.git" --enable
done
echo "Done. Hold Super to see the desk numbers: see the day bar's README to bind it."
