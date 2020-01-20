module Profightdb
  module FileHandler
    extend self

    def save(url, prevent_refetching: true)
      path = file_path(url)

      if prevent_refetching && File.exist?(path)
        Rails.logger.info("Preventing a refetch of #{url}...")
        return
      end

      content = ScraperApi.fetch(url)
      File.open(path, "wb") do |file|
        Rails.logger.info("Writing #{url} to #{path}")
        file.write content
        file.close
      end

      content
    end

    def file_path(url)
      basename = url.split("/").last.split(".").first
      "#{Profightdb::Constants::HTML_CACHE_DIR}/#{basename}.html"
    end

    def read(path)
      File.open(path) do |file|
        if block_given?
          yield file.read
        else
          file.read
        end

        file.close
      end
    end
  end
end