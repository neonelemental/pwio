module Profightdb
  module Scrapers
    module ShowScraper
      extend Profightdb::FileHandler
      extend self

      def scrape(url)
        save(url, organize_by: :show)
      end
    end
  end
end