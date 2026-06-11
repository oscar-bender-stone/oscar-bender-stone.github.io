# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

# TODO: adjust default font
# TODO: adjust palette as needed

import json

import matplotlib.colors
from wordcloud import WordCloud

# WARNING: relative path is based on
# root of repo. Maybe this can be made cleaner?
with open("./assets/interests.json") as file:
    word_counts = json.load(file)

# Inspired by this theme:
# https://duckduckgo.com/?q=doom+one+github&ia=web
palette = {
    "red": "#ff6c6b",
    "orange": "#da8548",
    "yellow": "#ecbe7b",
    "green": "#98be65",
    "blue": "#51afef",
    "sky": "#d1e0ff",
    "orchid": "#be95ff",
    "purple": "#A2A1FF",
    "magenta": "#e492ff",
}

colormap = matplotlib.colors.LinearSegmentedColormap.from_list(
    "doom_one", list(palette.values())
)

wordcloud = WordCloud(
    background_color="white", colormap=colormap
).generate_from_frequencies(word_counts)
wordcloud.to_file("./assets/images/interests_cloud.png")
