// SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
// SPDX-License-Identifier: MIT
// Currently stores configuration variables.

const titleText = "Oscar Bender-Stone";

document.addEventListener("DOMContentLoaded", () => {
  const title = document.getElementById("title");
  if (title) title.textContent = titleText;
});
