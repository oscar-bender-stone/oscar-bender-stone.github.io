# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

default: serve

push:
    @git checkout gh-pages && \
      git merge gh-pages main && \
      git push && \
      git checkout main && \
      git push

wordcloud:
    @uv --project ./source/python \
      run ./source/python/my_wordcloud.py 

serve:
    deno task serve

clean:
    @echo "Removing generated HTML files..."
    rm -rf _site
