// SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
// SPDX-License-Identifier: MIT

import lume from "lume/mod.ts";
import date from "lume/plugins/date.ts";
import lightningcss from "lume/plugins/lightningcss.ts";
import nav from "lume/plugins/nav.ts";
import pagefind from "lume/plugins/pagefind.ts";

const site = lume(
  {
    src: "./src",
    dest: "./_site",
  },
);

site.use(nav());
site.use(pagefind({
  ui: {
    containerId: "search",
  },
}));
site.use(date());
site.use(lightningcss());

site.data("layout", "layout.vto");
site.add("css");
site.copy("assets");

site.preprocess([".md"], (pages) => {
  pages.forEach((p) => p.data.url = p.data.url.replace("/markdown/", "/"));
});

site.preprocess([".md"], async (pages) => {
  for (const page of pages) {
    if (page.data.nocite && page.data.bibliography) {
      const filePath = site.src(page.src.path + page.src.ext);
      const bibFile = page.data.bibliography;
      const cslFile = "assets/csl/acm.csl";

      const { stdout } = await new Deno.Command("pandoc", {
        args: [
          "--citeproc",
          `--csl=${cslFile}`,
          `--bibliography=${bibFile}`,
          filePath,
          "-t",
          "html",
        ],
      }).output();

      page.data.content = new TextDecoder().decode(stdout);
    }
  }
});

export default site;
