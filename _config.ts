import lume from "lume/mod.ts";
import nav from "lume/plugins/nav.ts";
import pagefind from "lume/plugins/pagefind.ts";

const site = lume(
  {
    src: "./src",
    dest: "./_site",
  },
);

site.use(nav());
site.use(pagefind());

site.data("layout", "layout.vto");
site.copy("css");
site.copy("assets");

site.preprocess([".md"], (pages) => {
  pages.forEach((p) => p.data.url = p.data.url.replace("/markdown/", "/"));
});

site.preprocess([".md"], async (pages) => {
  for (const page of pages) {
    if (page.data.nocite && page.data.bibliography) {
      const filePath = site.src(page.src.path + page.src.ext);
      const bibFile = page.data.bibliography;

      const { stdout } = await new Deno.Command("pandoc", {
        args: [
          "--citeproc",
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
