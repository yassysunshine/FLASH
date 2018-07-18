class CreateSeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :seeds do |t|
      t.string :title
      t.string :owner
      t.integer :user_id

      t.timestamps
    end
  end
end
