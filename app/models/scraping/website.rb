module Scraping
  class Website < ApplicationRecord
    has_many :web_pages
  end
end
