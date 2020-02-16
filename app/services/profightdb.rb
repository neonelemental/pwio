module Profightdb
  extend Scraping::VisitTracking
  extend self

  def website
    Scraping::Website.find_by!(name: "Profightdb")
  end
end