// SPDX-FileCopyrightText: 2026 Oscar Bender-Stone <oscar-bender-stone@protonmail.com>
// SPDX-License-Identifier: MIT

import { dirname, join } from "jsr:@std/path";
import lume from "lume/mod.ts";
import date from "lume/plugins/date.ts";
import lightningcss from "lume/plugins/lightningcss.ts";
import nav from "lume/plugins/nav.ts";
import pagefind from "lume/plugins/pagefind.ts";
import readingInfo from "lume/plugins/reading_info.ts";

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
site.use(readingInfo());

site.data("layout", "layout.vto");
site.add("css");
site.copy("assets");

site.preprocess([".md"], (pages) => {
  pages.forEach((p) => p.data.url = p.data.url.replace("/markdown/", "/"));
});

site.preprocess([".md"], (pages) => {
  for (const page of pages) {
    const url = page.data.url;
    if (url === "/blog/") {
      page.data.layout = "blog_index.vto";
    } else if (url.startsWith("/blog/posts/")) {
      page.data.layout = "post.vto";
    }
  }
});

site.preprocess([".md"], async (pages) => {
  for (const page of pages) {
    if (page.data.nocite && page.data.bibliography) {
      const postPath = site.src(page.src.path + page.src.ext);
      const postDir = dirname(postPath);

      const bibPathRaw = page.data.bibliography;
      const bibPath = ["./", "/", "assets"].some(prefix => bibPathRaw.startsWith(prefix))
        ? site.src(bibPathRaw)
        : join(postDir, bibPathRaw);
      const cslPath = "assets/csl/acm.csl";

      const { stdout } = await new Deno.Command("pandoc", {
        args: [
          "--citeproc",
          `--csl=${cslPath}`,
          `--bibliography=${bibPath}`,
          postPath,
          "-t",
          "html",
        ],
      }).output();

      page.data.content = new TextDecoder().decode(stdout);
    }
  }
});

export default site;
