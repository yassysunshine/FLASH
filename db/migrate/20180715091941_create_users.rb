class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :icon
      t.string :password_digest
      t.integer :favorite_id

      t.timestamps
    end
  end
end
