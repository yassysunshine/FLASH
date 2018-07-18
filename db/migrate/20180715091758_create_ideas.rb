class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :content
      t.string :image
      t.string :image
      t.integer :favorite_id
      t.string :seed_name1
      t.string :seed_name2

      t.timestamps
    end
  end
end
