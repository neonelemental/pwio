module Scraping
  class RenameHtmlFilesJob < ApplicationJob
    Scraping::WebPage.includes(:page_visits).find_each do |page|
      page.page_visits
    end
  end
end