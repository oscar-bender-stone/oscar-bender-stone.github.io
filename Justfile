# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

default: build

all: build push

rebuild: clean build

push:
    @git checkout gh-pages && \
      git merge gh-pages main && \
      git push && \
      git checkout main && \
      git push

wordcloud:
    @uv --project ./source/python \
      run ./source/python/my_wordcloud.py 

build-dir dir="." target="pages":
    @mkdir -p {{ target }}
    @find "markdown/{{ dir }}" -maxdepth 1 -name "*.md" -exec ./scripts/build-page.sh {} {{ target }} \;

build-main:
    @just build-dir

build-blog:
    @just build-dir blog
    @just build-dir blog/posts

# Iterate over all files in markdown
# and check time-stamp for changes
build:
    cp -r source/css pages/
    @echo "Checking for modified files..."
    @just build-main
    @just build-blog
    @echo "Build complete."

clean:
    @echo "Removing generated HTML files..."
    rm -f pages/css/*.css
    rm -f pages/*.html
    rm -f pages/blog/*.html
    rm -f pages/blog/posts/*.html
