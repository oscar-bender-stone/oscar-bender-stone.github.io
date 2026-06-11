# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

all: index bibtex

index:
    pandoc index.md -s \
      --include-before-body=./templates/_navigation.html \
      -f markdown -t html -o docs/index.html

bibtex:
    pandoc -f markdown -t html ./templates/publications.md \
    -s --citeproc \
    -o docs/publications.html \
    --csl=./assets/csl/acm.csl \
    --bibliography=./assets/publications.bib \
    --metadata title="Publications" \
    --metadata copyright="SPDX-FileCopyrightText: Copyright (c) 202 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>" \
    # We need this split
    # in the license ID for REUSE
    --metadata license="SPDX-License-" "Identifier: MIT" \
