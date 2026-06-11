// SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
// SPDX-License-Identifier: MIT
// Currently stores configuration variables.

const CONFIG = {
  fullName: "Oscar Bender-Stone",
  emailAddress: "obenderstone@uiowa.edu",
};

document.addEventListener("DOMContentLoaded", () => {
  const title = document.getElementById("title");
  if (title) title.textContent = CONFIG.fullName;

  const emailAddress = CONFIG.emailAddress;
  const contact = document.getElementById("contact");
  if (contact) contact.innerHTML = `<strong>Email:</strong> <a href=${emailAddress}>${emailAddress}</a>`;
});
