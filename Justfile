# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

bibtex:
    pandoc -f bibtex -t html -s  \
      --csl=assets/csl/acm.csl \\
      --citeproc \
      --metadata nocite="@*" \
      ./assets/publications.bib -o test.html
