module Profightdb
  class ShowScraperJob < ApplicationJob
    queue_as :default

    def perform(url, prevent_refetching: true)
      Profightdb.visit(Profightdb::Scrapers::ShowScraper, url, prevent_refetching: prevent_refetching)
    end
  end
end