class AddWebPageableIdAndWebPageableTypeToWebPages < ActiveRecord::Migration[6.0]
  def change
    add_column :web_pages, :web_pageable_id, :integer
    add_column :web_pages, :web_pageable_type, :string
  end
end
