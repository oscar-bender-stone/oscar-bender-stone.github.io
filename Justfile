
bibtex:
    pandoc -f bibtex -t html -s  \
      --csl=assets/csl/acm.csl \\
      --citeproc \
      --metadata nocite="@*" \
      ./assets/publications.bib -o test.html
