class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string "title"
      t.string "movie"
      t.string "image"
      t.integer "user_id"
      t.integer "product_id"
      t.text "information"
      t.timestamps
    end
  end
end
