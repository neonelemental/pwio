class WebPage < ApplicationRecord
  belongs_to :web_pageable, polymorphic: true
  belongs_to :website
  has_many :page_visits
end
