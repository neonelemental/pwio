module Profightdb
  module Parsers
    class ShowPageParser < BaseParser
      def show_date
        css_select(".right-content > table tr:nth-child(1) > td:nth-child(1)").
            first.content.split("Date: ").last.to_date
      end

      def show_name
        css_select(".right-content h1").first.content.strip!
      end

      def show_ppv?
        css_select(".right-content > table tr:nth-child(1) > td:nth-child(2)").
            first.content.split("Pay Per View: ").last.downcase.strip == "yes"
      end

      def show_venue_hash
        node = css_select(".right-content > table tr:nth-child(2) > td:nth-child(1)").first
        venue_strings = node.content.split("Venue: ").second.strip.split(",")

        {
          country: node.css("img")&.first&.attributes&.fetch("alt")&.value,
          name: venue_strings.first&.strip,
          city: venue_strings.second&.strip,
          state: venue_strings.third&.strip,
        }
      end

      def show_promotion_hash
        node = css_select(".right-content > table tr:nth-child(2) > td:nth-child(2)").first

        {
          short_name: node.content.split("Promotion: ").last.strip
        }
      end

      def show_attendance
        attendance = css_select(".right-content > table tr:nth-child(3) > td:nth-child(1)").
            first.content.split("Attendance: ").last.strip

        attendance.downcase == "unknown" ? 0 : attendance.to_i
      end
    end
  end
end