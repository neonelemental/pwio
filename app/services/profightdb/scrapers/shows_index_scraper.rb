module Profightdb
  module Scrapers
    module ShowsIndexScraper
      extend Profightdb::FileHandler
      extend self

      def scrape(url)
        save(url, prevent_refetching: false, cache_by_date: true, organize_by: :shows_index)
      end
    end
  end
end