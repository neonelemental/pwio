module Profightdb
  module Scrapers
    module ShowScraper
      extend Utilities::FileHandling
      extend self

      def scrape(url)
        save(
            url,
            organize_by: :show,
            base_path: Profightdb::Constants::HTML_CACHE_DIR
          )
      end
    end
  end
end