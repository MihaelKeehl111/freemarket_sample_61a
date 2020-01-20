# Mercari DB設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_kana|string|null: false|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|phone-number|integer|
|postcode|integer|
|prefecture|string|
|shichoson|string|
|banchi|string|
|building|string|
|rates|integer|null: false|
|revenue|integer|null: false|
|profile-picture|string|
### Association
- has_many :products
- has_many :comments
- has_many :rates
- has_many :notices

## rateテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|
|comment|text|
|comment_user_id|integer|
|rated_user_id|integer
### Association
- belongs_to :user_id

## productテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|seller|string|null: false|
|category1_id|integer|
|category2_id|integer|
|category3_id|integer|
|size_id|integer|
|brand|string|
|status|integer|null: false|
|shipping-charge|integer|null: false|
|shipping-method|null: false|
|shipping-date|null: false|
|shipping-origin|string|null: false|
|registration-date|null: false|
|status|integer|null: false|
### Association
- has_many :comments
- has_many :likes
- has_many :images
- belongs_to :user

## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_is|string|null: false|
### Association
- belongs_to :product

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
|category1_id|integer|null: false, foreign_key: true|
- has_many :products
- has_many :category3s
- belongs_to :category1

## category3テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category2_id|integer|null: false, foreign_key: true|
### Association
- has_many :products
- has_many :sizes
- belongs_to :category2

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category3_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :category3

## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## commentテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|
|user_id|integer|
|product_id|integer|
### Association
- belongs_to :product
- belongs_to :user

## noticeテーブル
|Column|Type|Options|
|------|----|-------|
|notice|text|null: false|
|date|
### Association
- has_many :notices_users
- has_many :users, through: :notices_users

## notices_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|notice_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :notice
