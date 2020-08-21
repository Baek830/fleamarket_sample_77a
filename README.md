
# README

This README would normally document whatever steps are necessary to get the
application up and running.


* version
  - Ruby 2.5.1
  - Rails 5.2.4.3

* System dependencies

* Configuration

# Database creation

## Users table
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

## Products table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|brand|string||
|condition_id(active_hash)|integer|null: false|
|shipping_cost_id(active_hash)|integer|null: false|
|shipment_date_id(active_hash)|integer|null: false|
|prefecture_id(active_hash)|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|buyer_id|references||
|seller_id|references|null: false|
### Association
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- belongs_to :category
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'

## Images table
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :products

## Delivery_addresses table
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|phonetic_first_name|string|null: false|
|phonetic_last_name|string|null: false|
|postal_code|integer|null: false|
|prefecture_id(active_hash)|integer|null: false|
|city|srting|null: false|
|ward|string|null: false|
|building|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## Categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products

## Comments table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to: user
- belongs_to: product

## Favorites table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to: user
- belongs_to: product

## Credit_cards table
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to: user