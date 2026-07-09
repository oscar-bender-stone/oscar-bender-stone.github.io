#!/bin/sh
# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

# Name of file *relative* to the folder `markdown``
SRC_FILE="$1"

# Form output folder
SRC_DIR=$(dirname "$SRC_FILE")
OUT_DIR="pages${SRC_DIR#markdown}"

# Form output file path
SRC_STEM=$(basename "$SRC_FILE" .md)
OUT_FILE="$OUT_DIR/$SRC_STEM.html"

# Get relative path from target file
TARGET="$TARGET_DIR/$STEM.html"

echo "$OUT_DIR"
echo "$OUT_FILE"

if [ ! -f "$TARGET" ] || [ "$SRC_FILE" -nt "$TARGET" ]; then
  echo " Compiling $SRC_FILE ──> $OUT_FILE"

  # Ensure output folder exists
  mkdir -p "$OUT_DIR"

  # Find number of dots needed
  SLASHES=$(echo "${OUT_DIR}" | tr -cd "/" | wc -m)

  # Get start of relative path
  ROOT_PREFIX=""
  COUNTER="$SLASHES"
  while [ "$COUNTER" -gt 0 ]; do
    ROOT_PREFIX=$(printf '%s.' "$ROOT_PREFIX")
    COUNTER=$((COUNTER - 1))
  done

  pandoc "$SRC_FILE" -d ./scripts/pandoc/config.yaml \
    -V root="$ROOT_PREFIX" \
    -o "$OUT_FILE"
fi
