module Profightdb
  class ShowScraperJob < ApplicationJob
    queue_as :default

    def perform(url)
      Profightdb::Scraper.scrape_show(url)
    end
  end
end