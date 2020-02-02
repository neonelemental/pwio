module Profightdb
  class ShowsScraperJob < ApplicationJob
    queue_as :default

    def perform(url: Profightdb::Constants::SHOWS_BASE_URL)
      page_content = Profightdb::Scraper.scrape_shows_index(url)
      parser = Profightdb::Parsers::ShowsIndexParser.new(page_content)

      next_page_url = parser.shows_table_next_page_link
      ShowsScraperJob.perform_later(url: next_page_url)

      parser.shows_table_show_urls.each do |show_url|
        ShowScraperJob.perform_later(url: show_url)
      end
    end
  end
end