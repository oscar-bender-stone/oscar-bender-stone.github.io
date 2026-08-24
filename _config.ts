import lume from "lume/mod.ts";
import nav from "lume/plugins/nav.ts";
import pagefind from "lume/plugins/pagefind.ts";

const site = lume(
  {
    src: "./src",
    dest: "./_site",
  },
);

site.data("layout", "layout.vto");
site.copy("css");

site.preprocess([".md"], (pages) => {
  pages.forEach((p) => p.data.url = p.data.url.replace("/markdown/", "/"));
});

site.use(nav());
site.use(pagefind());

export default site;
