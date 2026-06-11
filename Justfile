# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

bibtex:
    pandoc -f markdown -t html ./templates/publications.md \
    -s --citeproc \
    -o docs/publications.html \
    --bibliography=./assets/publications.bib \
    --metadata copyright="SPDX-FileCopyrightText: Copyright (c) 202 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>" \
    --metadata license="SPDX-License-Identifier: MIT" \
