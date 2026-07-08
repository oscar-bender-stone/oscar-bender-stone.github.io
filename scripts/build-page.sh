#!/bin/sh
# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

FILE="$1"
TARGET_DIR="$2"

STEM=$(basename "$FILE" .md)
TARGET="$TARGET_DIR/$STEM.html"

if [ ! -f "$TARGET" ] || [ "$FILE" -nt "$TARGET" ]; then
  echo " Compiling $FILE ──> $TARGET"
  pandoc "$FILE" -d pandoc-config.yaml -o "$TARGET"
fi
