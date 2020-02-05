class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.date :date
      t.boolean :ppv
      t.integer :attendance
      t.integer :venue_id
      t.integer :promotion_id
      t.string :name

      t.timestamps
    end
  end
end
