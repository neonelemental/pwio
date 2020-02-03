module Profightdb
  extend VisitTracking
  extend self

  private

  def website
    Website.find_by!(name: "Profightdb")
  end
end