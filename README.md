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


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|birthday|string|null: false|
|name|string|null: false|
|name(kana)|string|null: false|
|tel_number|string|null: false|
|security_number|string|null: false|
|adress|string|null: false|
|card_number|string|null: false|
|image|string||
|evaluation|integer||
### Association
- has_many :comments
- has_many :products

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|condition|string|null: false|
|delivery_charge|string|null: false|
|delivery_method|string|null: false|
|delivery_area|string|null: false|
|delivery_date|string|null: false|
|price|string|null: false|
|detail|text|null: false|
|good|integer||
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- has_many :comments
- has_many :products_categories1

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|integer|null: false, foreign_key: true|
|date|timestamp||
### Association
- belongs_to :products

## products_categories1テーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|categories1_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :products
- belongs_to :categories1

## categories1テーブル
|Column|Type|Options|
|------|----|-------|
|category|integer|null: false|
### Association
- has_many :categories2

## categories2テーブル
|Column|Type|Options|
|------|----|-------|
|category|integer|null: false|
### Association
- belongs_to :categories1
- has_many :categories3

## categories3テーブル
|Column|Type|Options|
|------|----|-------|
|category|integer|null: false|
- belongs_to :categories2

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|