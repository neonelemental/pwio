class CreatePageVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :page_visits do |t|
      t.integer :web_page_id
      t.datetime :visited_at
      t.string :file_path

      t.timestamps
    end
  end
end
