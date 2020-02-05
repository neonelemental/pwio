module Profightdb
  class ShowParserJob < ApplicationJob
    def perform(show_html_path)
      web_page = WebPage.by_local_file_path(show_html_path)
      parser = Profightdb::Parsers::ShowPageParser.new(web_page.to_html)

      show = web_page.web_pageable || Show.new
      show.date = parser.show_date
      show.name = parser.show_name
      show.ppv = parser.show_ppv?
      show.venue = Venue.find_or_create_by!(parser.show_venue_hash)
      show.promotion = Promotion.find_or_create_by!(parser.show_promotion_hash)
      show.attendance = parser.show_attendance

      if show.new_record?
        show.save!
        web_page.web_pageable = show
        web_page.save!
      else
        show.save!
      end
    end
  end
end