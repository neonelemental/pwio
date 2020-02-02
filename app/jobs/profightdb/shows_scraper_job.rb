module Profightdb
  class ShowsScraperJob < ApplicationJob
    queue_as :default

    def perform(url: Profightdb::Constants::SHOWS_BASE_URL)
      local_file = Profightdb::Scraper.scrape_shows_index(url)
      Profightdb.create_page_visit(local_file.url, local_file.path)
      parser = Profightdb::Parsers::ShowsIndexParser.new(local_file.content)

      next_page_url = parser.shows_table_next_page_link
      ShowsScraperJob.perform_later(url: next_page_url)

      parser.shows_table_show_urls.each do |show_url|
        ShowScraperJob.perform_later(url: show_url)
      end
    end
  end
end