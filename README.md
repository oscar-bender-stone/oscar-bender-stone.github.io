<!-- SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com> -->
<!-- SPDX-License-Identifier: MIT -->

# Academic Portfolio

> [!WARNING]
> This website is Work in Progress!

My academic portfolio website.

Dates: 2026-Present.

## License

Except where noted, no unauthorized distribution of the content of the markdown
files without permission [./LICENSES/LicenseRef-Proprietary.txt].

## Generation

This website is made through simple HTML generation. To generate files, make
sure to have [`just`](https://github.com/casey/just) and
[`pandoc`](https://pandoc.org) installed. Then run `just` or `just build`. Smart
caching is included, so it should only update HTML when markdown is changed.

### Word Cloud

To generate the word cloud, you will need [`uv`](https://docs.astral.sh/uv/)
installed. Then, run: `just wordcloud`.
