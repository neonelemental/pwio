module Profightdb
  class ShowsScraperJob < ApplicationJob
    queue_as :default

    def perform(url: Profightdb::Constants::SHOWS_BASE_URL, follow_next_page: false)
      visit = Profightdb.visit(Profightdb::Scrapers::ShowsIndexScraper, url)
      parser = Profightdb::Parsers::ShowsIndexParser.new(visit.content)

      next_page_url = parser.shows_table_next_page_link
      ShowsScraperJob.perform_later(url: next_page_url) if follow_next_page

      parser.shows_table_show_urls.each { |show_url| ShowScraperJob.perform_later(show_url) }
    end
  end
end