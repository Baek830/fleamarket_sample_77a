# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


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
