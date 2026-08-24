# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

default: serve

current_branch := `git branch --show-current`

push:
    git checkout main
    git merge {{ current_branch }}
    git push origin main
    git checkout {{ current_branch }}

wordcloud:
    uv --project ./source/python \
      run ./source/python/my_wordcloud.py 

serve:
    deno task serve

clean:
    echo "Removing generated HTML files..."
    rm -rf _site
