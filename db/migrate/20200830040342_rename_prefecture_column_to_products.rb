class RenamePrefectureColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :prefecture, :prefecture_id
  end
end
