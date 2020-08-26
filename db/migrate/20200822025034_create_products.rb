class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :brand
      t.integer :condition_id, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :shipment_date_id, null: false
      t.integer :prefecture, null: false
      # t.references :category, foreign_key: true
      t.references :buyer
      t.references :seller, null: false
      t.timestamps
    end
  end
end
