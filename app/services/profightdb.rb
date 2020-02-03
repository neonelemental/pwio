module Profightdb
  extend Utilities::VisitTracking
  extend self

  def website
    Website.find_by!(name: "Profightdb")
  end
end