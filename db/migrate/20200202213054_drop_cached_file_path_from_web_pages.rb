class DropCachedFilePathFromWebPages < ActiveRecord::Migration[6.0]
  def change
    remove_column :web_pages, :cached_file_path
  end
end
