class Product < ApplicationRecord
  belongs_to :category
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :condition
  # belongs_to_active_hash :shipping_cost
  # belongs_to_active_hash :prefecture
  # belongs_to_active_hash :shipment_date
end
