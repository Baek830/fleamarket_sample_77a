class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          validates :nickname, :first_name, :last_name, :phonetic_first_name, :phonetic_last_name, :birthday ,presence: true
          has_many :delivery_addresses, dependent: :destroy
          accepts_nested_attributes_for :delivery_addresses
end
