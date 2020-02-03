class PageVisit < ApplicationRecord
  belongs_to :web_page
  has_one :website, through: :web_page

  def content
    File.read(file_path)
  end
end
