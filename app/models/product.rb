class Product < ApplicationRecord
  belongs_to :category
  validates :images, :name, :description, :price, :condition_id, :shipping_cost_id, :shipment_date_id, :prefecture_id, presence: true
  validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 158, message: 'カテゴリーを選択してください'}
  # validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 13}
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many :images, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipment_date
end
