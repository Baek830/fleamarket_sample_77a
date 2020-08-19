## Delivery_addresses
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|phonetic_first_name|string|null: false|
|phonetic_last_name|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|srting|null: false|
|adress1|string|null: false|
|adress2|string||
|phone_number|integer||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## Users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|phonetic_first_name|string|null: false|
|phonetic_last_name|string|null: false|
|birthday|date|null: false|

### Association
- has_many :credit_cards, dependent: :destroy
- has_many :delivery_addresses, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy