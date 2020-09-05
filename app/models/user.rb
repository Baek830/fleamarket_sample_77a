class User < ApplicationRecord
  has_many :products
  has_many :bought_products, class_name: "Product", foreign_key: "buyer_id"
  has_many :selling_products, -> { where("buyer_id is NULL")}, class_name: "Product", foreign_key: "seller_id"
  has_many :sold_products, -> { where("buyer_id is not NULL")}, class_name: "Product", foreign_key: "seller_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          validates :nickname, :first_name, :last_name, :phonetic_first_name, :phonetic_last_name, :birthday ,presence: true
          has_many :delivery_addresses, dependent: :destroy
          accepts_nested_attributes_for :delivery_addresses
end
