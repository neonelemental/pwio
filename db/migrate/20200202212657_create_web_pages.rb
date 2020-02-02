class CreateWebPages < ActiveRecord::Migration[6.0]
  def change
    create_table :web_pages do |t|
      t.string :url
      t.string :cached_file_path
      t.integer :website_id

      t.timestamps
    end
  end
end
