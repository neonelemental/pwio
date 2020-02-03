module VisitTracking
  def visit(scraper, url)
    local_file = scraper.scrape(url)
    create_visit(local_file)
  end

  private

  def create_visit(local_file)
    web_page = find_or_create_web_page(local_file.url)
    PageVisit.create!(web_page: web_page, file_path: local_file.path, visited_at: DateTime.now)
  end

  def find_or_create_web_page(url)
    WebPage.find_or_create_by!(url: url, website: website)
  end

  def website
    raise NotImplementedError
  end
end