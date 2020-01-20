module ScraperApi
  require "httparty"

  module Request
    extend self

    def get(url)
      Rails.logger.info("Fetching #{url}...")
      validate_response! HTTParty.get(Constants::SCRAPER_API_URL, query: query(url))
    end

    private

    def query(url)
      { api_key: ENV["SCRAPER_API_KEY"], url: url }
    end

    def validate_response!(response)
      if error_string(response).present?
        raise Errors::RequestError.new(response.body)
      else
        response
      end
    end

    def error_string(response)
      body = response.body
      Constants::ERROR_STRINGS.find { |err_str| body.include? err_str }
    end
  end
end