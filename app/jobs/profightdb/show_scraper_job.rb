module Profightdb
  class ShowScraperJob < ApplicationJob
    queue_as :default

    def perform(url)
      Profightdb.visit(Profightdb::Scrapers::ShowScraper, url)
    end
  end
end