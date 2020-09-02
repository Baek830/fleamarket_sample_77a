class ChangeColumnNullToDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column_null :delivery_addresses, :first_name, false
    change_column_null :delivery_addresses, :last_name, false
    change_column_null :delivery_addresses, :phonetic_first_name, false
    change_column_null :delivery_addresses, :phonetic_last_name, false
  end
end
