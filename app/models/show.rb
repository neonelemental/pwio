class Show < ApplicationRecord
  belongs_to :promotion
  has_many :web_pages, inverse_of: :web_pageable
end
