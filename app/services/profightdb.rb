module Profightdb
  extend self

  def website
    Website.find_by!(name: "Profightdb")
  end

  def find_or_create_web_page(url)
    WebPage.find_or_create_by(url: url, website: website)
  end

  def create_page_visit(url, file_path)
    web_page = find_or_create_web_page(url)
    PageVisit.create(web_page: web_page, file_path: file_path, visited_at: DateTime.now)
  end
end