module Profightdb
  module Scrapers
    module ShowsIndexScraper
      extend Utilities::FileHandling
      extend self

      def scrape(url, prevent_refetching: false)
        save(
            url,
            prevent_refetching: prevent_refetching,
            cache_by_date: true,
            organize_by: :shows_index,
            base_path: Profightdb::Constants::HTML_CACHE_DIR
          )
      end
    end
  end
end