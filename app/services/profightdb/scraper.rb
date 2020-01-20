module Profightdb
  module Scraper
    extend self

    def scrape_shows(url: Profightdb::Constants::SHOWS_BASE_URL)
      shows_index_page = Profightdb::FileHandler.
          save(url, prevent_refetching: false)

      parser = Profightdb::Parser.new(shows_index_page)
      next_page = parser.shows_table_next_page_link
      parser.shows_table_show_urls.
          each { |show_url| Profightdb::FileHandler.save(show_url) }

      scrape_shows(url: next_page)
    end
  end
end