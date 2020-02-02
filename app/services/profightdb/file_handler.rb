module Profightdb
  module FileHandler
    extend self

    def save(url, prevent_refetching: true, organize_by: nil, cache_by_date: false)
      path = file_path(url, cache_by_date: cache_by_date, organize_by: organize_by)

      if prevent_refetching && File.exist?(path)
        Rails.logger.info("Preventing a refetch of #{url}...")
        return
      end

      content = ScraperApi.fetch(url)
      File.open(path, "wb") do |file|
        Rails.logger.info("#{url} => #{path}")
        file.write content
        file.close
      end

      content
    end

    def file_path(url, cache_by_date: false, organize_by: nil)
      basename = url.split("/").last.split(".").first
      base_path = Profightdb::Constants::HTML_CACHE_DIR.to_s

      if !!organize_by
        base_path += "/#{organize_by.to_s}"
        FileUtils.mkdir_p base_path
      end

      if cache_by_date
        base_path += "/#{Date.today.strftime("%Y-%m-%d")}"
        FileUtils.mkdir_p base_path
      end

      "#{base_path}/#{basename}.html"
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