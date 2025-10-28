#!/usr/bin/env bash
set -euo pipefail
REPO_ROOT="${1:-.}"
OUT="TREE.md"

PRUNE_DIRS=(
  ".git"
  "node_modules"
  "dist"
  "build"
  "coverage"
  ".next"
  ".turbo"
  ".cache"
)

prune_expr=()
for d in "${PRUNE_DIRS[@]}"; do
  prune_expr+=( -name "$d" -o )
done
# Remove last -o
unset 'prune_expr[${#prune_expr[@]}-1]' || true

{
  echo "# Repository File Tree"
  echo
  echo '```'
  find "$REPO_ROOT" \( "${prune_expr[@]}" \) -prune -false -o -type f -print     | sed "s|^\./||" | sort
  echo '```'
} > "$OUT"

echo "Wrote $OUT"
