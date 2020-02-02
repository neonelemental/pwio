module Profightdb
  module Scraper
    extend self

    def scrape_shows_index(url: Profightdb::Constants::SHOWS_BASE_URL)
      Profightdb::FileHandler.
          save(url, prevent_refetching: false, organize_by: :shows_index, cache_by_date: true)
    end

    def scrape_show(url)
      Profightdb::FileHandler.save(url, organize_by: :show)
    end
  end
end