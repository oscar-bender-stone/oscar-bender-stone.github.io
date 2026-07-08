#!/bin/sh
# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

file="$1"
target_dir="$2"

stem=$(basename "$file" .md)
target="$target_dir/$stem.html"

if [ ! -f "$target" ] || [ "$file" -nt "$target" ]; then
  echo " Compiling $file ──> $target"
  pandoc "$file" -d pandoc-config.yaml -o "$target"
fi
