# frozen_string_literal: true
module Jekyll
  class Theme404Generator < Generator
    safe true
    priority :low
    def generate(site)
      return if site.pages.any? { |page| page.url == "/404.html" }
      page = PageWithoutAFile.new(site, site.source, "", "404.html")
      page.data["layout"] = "page"
      page.data["title"] = "404"
      page.data["permalink"] = "/404.html"
      page.content = File.read(File.expand_path("../_includes/404.html", __dir__))
      site.pages << page
    end
  end
end
