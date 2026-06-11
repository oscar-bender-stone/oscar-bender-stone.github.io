# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

# Include copyright generation here
# to avoid REUSE errors.
copyright := "SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com"
license := "SPDX-License-" + "Identifier: " + "MIT"

default: build

rebuild: clean build

push:
    @git checkout gh-pages && \
      git merge gh-pages main && \
      git push && \
      git checkout main && \
      git push

# Iterate over all files in markdown
# and check time-stamp for changes
build:
    @echo "Checking for modified files..."

    @find markdown -name "*.md" -exec sh -c ' \
        for file; do \
            stem=$(basename "$file" .md); \
            target="pages/$stem.html"; \
            if [ ! -f "$target" ] || [ "$file" -nt "$target" ]; then \
                echo "   Compiling $file ──> $target"; \
                pandoc "$file" -d pandoc-config.yaml \
                    --metadata license="{{ license }}" \
                    --metadata copyright="{{ copyright }}" \
                    -o "$target"; \
            fi; \
        done' _ {} +
    @echo "Build complete."

clean:
    @echo "Removing generated HTML files..."
    rm -f docs/*.html
