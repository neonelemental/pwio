module Profightdb
  class RefetchBadShowPagesJob < ApplicationJob
    def perform
      failed_jobs = DelayedJob.failed.by_class_name(Profightdb::ShowParserJob.name)
      failed_jobs.
          map(&:payload_object).
          map(&:job_data).
          map { |data| data["arguments"].first }.
          map { |path| WebPage.by_local_file_path(path) }.
          each { |record| ShowScraperJob.perform_later(record.url, prevent_refetching: false) }
    end
  end
end