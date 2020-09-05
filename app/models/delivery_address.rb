class DeliveryAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :phonetic_first_name, :phonetic_last_name, :postal_code, :city, :ward ,presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end