module Profightdb
  module Scrapers
    module ShowScraper
      extend Utilities::FileHandling
      extend self

      def scrape(url, prevent_refetching: true)
        save(
            url,
            organize_by: :show,
            base_path: Profightdb::Constants::HTML_CACHE_DIR,
            prevent_refetching: prevent_refetching
          )
      end
    end
  end
end