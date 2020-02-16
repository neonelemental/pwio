module Scraping
  class WebPage < ApplicationRecord
    belongs_to :web_pageable, polymorphic: true
    belongs_to :website
    has_many :page_visits

    scope :by_local_file_path, -> (html_path) do
      joins(:page_visits).
        where(page_visits: {
          file_path: File.expand_path(html_path)
        }).first
    end

    def last_page_visit
      page_visits.order(created_at: :desc).first
    end

    def to_html
      last_page_visit.content
    end
  end
end