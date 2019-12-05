class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string "title"
      t.string "image"
      t.string "genre"
      t.integer "price"
      t.string "initial"
      t.string "link"
      t.float "profit"
      t.timestamps
    end
  end
end
