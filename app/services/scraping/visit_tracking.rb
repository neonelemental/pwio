module Scraping
  module VisitTracking
    def visit(scraper, url, prevent_refetching: true)
      local_file = scraper.scrape(url, prevent_refetching: prevent_refetching)
      if local_file # an html document was fetched.
        create_visit(local_file)
      end
    end

    private

    def create_visit(local_file)
      web_page = find_or_create_web_page(local_file.url)
      Scraping::PageVisit.create!(web_page: web_page,
                                  file_path: local_file.path,
                                  visited_at: DateTime.now)
    end

    def find_or_create_web_page(url)
      Scraping::WebPage.find_or_create_by!(url: url, website: website)
    end

    def website
      raise NotImplementedError
    end
  end
end