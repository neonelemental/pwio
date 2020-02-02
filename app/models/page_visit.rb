class PageVisit < ApplicationRecord
  belongs_to :web_page
  has_one :website, through: :web_page
end
