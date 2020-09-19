class DeliveryAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :prefecture_id, :city, :ward, presence: true
  validates :first_name, :last_name, presence: true,
            format: {
              with: /\A[ぁ-んァ-ン一-龥]/,
              message: "は全角のみで入力して下さい"
            }
  validates :phonetic_first_name, :phonetic_last_name, presence: true,
            format: {
              with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
              message: "は全角カタカナのみで入力して下さい"
            }
  validates :postal_code,
            format: {
              with: /\A\d{7}\z/,
              message: "はハイフンなし7桁で入力して下さい"
            }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end