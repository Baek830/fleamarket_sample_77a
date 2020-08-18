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


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
