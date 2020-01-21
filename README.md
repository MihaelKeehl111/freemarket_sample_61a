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

# free marker_sample 61a  DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|commune|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|phone_number|integer|null: false|
### Association
- has_many :comments
- has_many :products
- has_many :likes

## productテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|detail|text|null: false|
|size|string|null: false|
|state|string|null: false|
### Association
- belongs_to :user
- has_many :comments
- belongs_to :category1
- belongs_to :category2
- belongs_to :category3
- belongs_to :brand
- has_many :images


## category1テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
- has_many :category2s

## category2テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
- belongs_to :category1
- has_many :category3s


## category3テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
- belongs_to :category2 


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products


## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
### Association
- belongs_to :product


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product


## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
