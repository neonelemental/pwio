module ScraperApi
  extend self

  def fetch(url)
    ScraperApi::Request.get(url)
  end
end