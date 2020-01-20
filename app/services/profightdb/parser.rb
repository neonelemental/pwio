module Profightdb
  class Parser
    def initialize(html)
      @html = html
      @context = Nokogiri.parse(html)
    end

    def shows_table_next_page_link
      to_url(css_select(".pager > a.selected + a").first)
    end

    def shows_table_show_urls
      css_select("div.table-wrapper > table > tr > td:nth-child(3) a").
          map { |node| to_url(node) }.
          select { |url| url.include?("/cards/") }.
          uniq
    end

    private

    def css_select(css_selector)
      @context.css(css_selector)
    end

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