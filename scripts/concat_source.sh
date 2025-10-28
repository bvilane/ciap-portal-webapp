#!/usr/bin/env bash
set -euo pipefail
REPO_ROOT="${1:-.}"
OUTFILE="${2:-ALL_CODE.txt}"

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

EXTS=(
  "js" "jsx" "ts" "tsx"
  "json" "md" "yml" "yaml"
  "html" "css" "sh" "py" "sql"
  "env" "example"
)

prune_expr=()
for d in "${PRUNE_DIRS[@]}"; do
  prune_expr+=( -name "$d" -o )
done
unset 'prune_expr[${#prune_expr[@]}-1]' || true

ext_expr=()
for e in "${EXTS[@]}"; do
  ext_expr+=( -name "*.${e}" -o )
done
# Add special files commonly used
ext_expr+=( -name "Dockerfile" -o -name "docker-compose.yml" )
unset 'ext_expr[${#ext_expr[@]}-1]' || true

: > "$OUTFILE"

# Collect files
mapfile -d '' FILES < <(find "$REPO_ROOT" \( "${prune_expr[@]}" \) -prune -false -o -type f \( "${ext_expr[@]}" \) -print0 | sort -z)

for f in "${FILES[@]}"; do
  echo "===== FILE: ${f} =====" >> "$OUTFILE"
  cat "$f" >> "$OUTFILE" || true
  printf "\n\n" >> "$OUTFILE"
done

echo "Wrote $OUTFILE"
