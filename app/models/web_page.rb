class WebPage < ApplicationRecord
  belongs_to :website
  has_many :page_visits
end
