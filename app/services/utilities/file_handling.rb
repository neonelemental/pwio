module Utilities
  module FileHandling
    def save(url, base_path:, prevent_refetching: true, organize_by: nil, cache_by_date: false)
      path = file_path(
          url,
          cache_by_date: cache_by_date,
          organize_by: organize_by,
          base_path: base_path
        )

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

      LocalFile.new(url, content, path)
    end

    def file_path(url, base_path:, cache_by_date: false, organize_by: nil)
      basename = url.split("/").last.split(".").first
      base_path = base_path.to_s # fixes Rails.root.joins issues if used.

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
  end
end