class User < ApplicationRecord
  has_many :products
  has_many :bought_products, class_name: "Product", foreign_key: "buyer_id"
  has_many :selling_products, -> { where("buyer_id is NULL")}, class_name: "Product", foreign_key: "seller_id"
  has_many :sold_products, -> { where("buyer_id is not NULL")}, class_name: "Product", foreign_key: "seller_id"
  has_many :favorites, dependent: :destroy
  has_many :favorite_products, through: :favorites, source: :product
  has_many :sns_credentials
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
          validates :nickname, :birthday , presence: true
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
          has_many :delivery_addresses, dependent: :destroy
          accepts_nested_attributes_for :delivery_addresses

def self.from_omniauth(auth)
  sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
  # sns認証したことがあればアソシエーションで取得
  # 無ければemailでユーザー検索して取得orビルド(保存はしない)
  user = sns.user || User.where(email: auth.info.email).first_or_initialize(
    nickname: auth.info.name,
      email: auth.info.email
  )
  # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
  if user.persisted?
    sns.user = user
    sns.save
  end
  { user: user, sns: sns }
end

def favorited_by?(product_id)
  favorites.where(product_id: product_id).exists?
end

end
