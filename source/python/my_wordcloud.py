# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

# TODO: adjust default font
# TODO: adjust palette as needed

import json
import random

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
    "orchid": "#be95ff",
    "purple": "#A2A1FF",
    "magenta": "#e492ff",
}


class ColorManager:
    """
    Manages colors used in word cloud. Ensures that every color is used at least once (if enough words are available).
    """

    def __init__(self, palette: dict[str, str]):
        self.palette = list(palette.values())
        self.pool = self.palette.copy()

    # color_func API reference: http://amueller.github.io/word_cloud/generated/wordcloud.WordCloud.html#wordcloud.WordCloud
    def get_color(self, *args, **kwargs):

        # When colors in pool run out,
        # reshuffle and start again
        if not self.pool:
            self.pool = list(self.palette)
            random.shuffle(self.pool)

        return self.pool.pop()


colormanager = ColorManager(palette)

wordcloud = WordCloud(
    background_color="white",
    color_func=colormanager.get_color,
    prefer_horizontal=0.50,
).generate_from_frequencies(word_counts)
wordcloud.to_file("./assets/images/interests_cloud.png")
