#!/bin/sh
# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

# Name of file *relative* to the folder `markdown``
SRC_FILE="$1"

# Get relative dir.
# Need to be careful to remove
# extra slashes and dots!
SRC_DIR=$(dirname "$SRC_FILE")
RELATIVE_DIR=${SRC_DIR#markdown}
if [ "$RELATIVE_DIR" = "/." ]; then
  RELATIVE_DIR=""
fi

# Set output folder
OUT_DIR="pages${RELATIVE_DIR}"

echo "RELATIVE_DIR: $RELATIVE_DIR"
echo "OUT_DIR: $OUT_DIR"

# Set output file path
SRC_STEM=$(basename "$SRC_FILE" .md)
OUT_FILE="$OUT_DIR/$SRC_STEM.html"

# Get relative path from target file
TARGET="$TARGET_DIR/$STEM.html"

if [ ! -f "$TARGET" ] || [ "$SRC_FILE" -nt "$TARGET" ]; then
  echo " Compiling $SRC_FILE ──> $OUT_FILE"

  # Ensure output folder exists
  mkdir -p "$OUT_DIR"

  # Find number of dots needed
  if [ -z "$RELATIVE_DIR" ]; then
    SLASHES=0
  else
    SLASHES=$(printf '%s' "$RELATIVE_DIR" | tr -cd "/" | wc -m)
    # First folder in relative path
    # counts as a slash
    SLASHES=$((SLASHES + 1))
  fi

  # Get start of relative path
  ROOT_PREFIX=""
  COUNTER="$SLASHES"
  while [ "$COUNTER" -gt 0 ]; do
    ROOT_PREFIX=$(printf '%s../' "$ROOT_PREFIX")
    COUNTER=$((COUNTER - 1))
  done

  if [ -z "$ROOT_PREFIX" ]; then
    ROOT_PREFIX="./"
  fi

  pandoc "$SRC_FILE" -d ./scripts/pandoc/config.yaml \
    -V root="$ROOT_PREFIX" \
    -o "$OUT_FILE"
fi
