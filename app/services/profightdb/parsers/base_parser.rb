module Profightdb
  module Parsers
    class BaseParser
      def initialize(html)
        @html = html
        @context = Nokogiri.parse(html)
      end

      def css_select(css_selector)
        @context.css(css_selector)
      end

      private

      def to_url(node)
        uri_or_url = node.attributes["href"].value
        root_url = Profightdb::Constants::ROOT_URL

        if uri_or_url.include? root_url
          uri_or_url
        else
          "#{root_url}#{uri_or_url}"
        end
      end
    end
  end
end