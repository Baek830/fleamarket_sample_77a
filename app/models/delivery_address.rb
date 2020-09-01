class DeliveryAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :postal_code, :city, :ward ,presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end