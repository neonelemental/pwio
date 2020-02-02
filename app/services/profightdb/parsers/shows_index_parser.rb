module Profightdb
  module Parsers
    class ShowsIndexParser < BaseParser
      def shows_table_next_page_link
        to_url(css_select(".pager > a.selected + a").first)
      end

      def shows_table_show_urls
        css_select("div.table-wrapper > table > tr > td:nth-child(3) a").
            map { |node| to_url(node) }.
            select { |url| url.include?("/cards/") }.
            uniq
      end
    end
  end
end