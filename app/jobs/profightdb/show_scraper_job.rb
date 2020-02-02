module Profightdb
  class ShowScraperJob < ApplicationJob
    queue_as :default

    def perform(url)
      local_file = Profightdb::Scraper.scrape_show(url)
      Profightdb.create_page_visit(local_file.url, local_file.path)
    end
  end
end