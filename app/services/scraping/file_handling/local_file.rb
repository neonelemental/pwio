module Scraping
  module FileHandling
    class LocalFile
      attr_reader :url,
                  :content,
                  :path

      def initialize(url, content, path)
        @url = url
        @content = content
        @path = path
      end
    end
  end
end