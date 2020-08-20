
# README

This README would normally document whatever steps are necessary to get the
application up and running.


* version
  - Ruby 2.5.1
  - Rails 5.2.4.3

* System dependencies

* Configuration

# Database creation

## Products table
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|brand|string||
|condition_id|references|null: false, foreign_key: true|
|shipping_cost_id|references|null: false, foreign_key: true|
|shipment_date_id|references|null: false, foreign_key: true|
|shipping_region_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|buyer_id|references||
|seller_id|references|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- belongs_to :condition
- belongs_to :shipping_cost
- belongs_to :shipment_date
- belongs_to :shipping_region
- belongs_to :category
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'

## Categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products


## Delivery_addresses
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|phonetic_first_name|string|null: false|
|phonetic_last_name|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
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


## Conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
- has_many :products


## Shipping_costsテーブル

|Column|Type|Options|
|------|----|-------|
|payer|string|null: false|

### Association
- has_many :products


## Shipment_datesテーブル

|Column|Type|Options|
|------|----|-------|
|days|string|null: false|

### Association
- has_many :products


## Shipping_regionsテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|

### Association
- has_many :products

