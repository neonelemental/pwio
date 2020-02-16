module Profightdb
  extend Scraping::VisitTracking
  extend self

  def website
    Website.find_by!(name: "Profightdb")
  end
end