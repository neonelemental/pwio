module ScraperApi
  module Constants
    SCRAPER_API_URL = "https://api.scraperapi.com"

    ERROR_STRINGS = [
      "Raw error:",
      "Unauthorized request",
      "503 Service Service Unavailable",
      "502 Bad Gateway",
    ].freeze
  end
end