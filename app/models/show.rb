class Show < ApplicationRecord
  has_many :web_pages, inverse_of: :web_pageable
end