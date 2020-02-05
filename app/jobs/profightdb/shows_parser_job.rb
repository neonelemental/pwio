module Profightdb
  class ShowsParserJob < ApplicationJob
    def perform
      Dir["lib/assets/html/profightdb/show/**/*.html"].each do |show_html_path|
        ShowParserJob.perform_later(show_html_path)
      end
    end
  end
end