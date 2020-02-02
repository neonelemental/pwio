module Profightdb
  module Scraper
    extend self

    def scrape_shows(url: Profightdb::Constants::SHOWS_BASE_URL, scrape_next_page: true)
      parser = Profightdb::Parsers::ShowsIndexParser.
          new(scrape_shows_index(url))

      next_page = parser.shows_table_next_page_link
      parser.shows_table_show_urls.each { |show_url| scrape_show(show_url) }

      if !!next_page && scrape_next_page # Do recursion to get the rest.
        scrape_shows(url: next_page)
      end
    end

    private

    def scrape_shows_index(url)
      Profightdb::FileHandler.
          save(url, prevent_refetching: false, organize_by: :shows_index, cache_by_date: true)
    end

    def scrape_show(url)
      Profightdb::FileHandler.save(url, organize_by: :show)
    end
  end
end