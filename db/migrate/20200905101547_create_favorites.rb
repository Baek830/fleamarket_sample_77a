class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :product_id, null: false, foreign_key: true

      t.timestamps

      t.index :user_id
      t.index :product_id
      t.index [:user_id, :product_id], unique: true
    end
  end
end
