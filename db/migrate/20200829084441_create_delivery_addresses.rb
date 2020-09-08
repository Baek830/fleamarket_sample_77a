class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :phonetic_first_name
      t.string :phonetic_last_name
      t.integer :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :ward, null: false
      t.string :building
      t.string :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
