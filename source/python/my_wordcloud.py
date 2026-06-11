# SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
# SPDX-License-Identifier: MIT

# TODO: adjust default font

import json

from wordcloud import WordCloud

# WARNING: relative path is based on
# root of repo. Maybe this can be made cleaner?
with open("./assets/interests.json") as file:
    word_counts = json.load(file)

wordcloud = WordCloud(background_color="white").generate_from_frequencies(word_counts)
wordcloud.to_file("./assets/images/interests_cloud.png")
