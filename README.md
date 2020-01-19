# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
|name(kana)|string|null: false|
|birthday|string|null: false|
|cellphone-number|integer|null: false|
|postal-code|integer|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building|string||
|phone-number|integer||
### Association
- has_many :products
- has_many :comments

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
|price|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|large_category_id|integer|null: false, foreign_key: true|
|middle_category_id|integer|null: false, foreign_key: true|
|small_category_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|status|string|null: false|
|shipping_charges|string|null: false|
|delivery_method|string|null: false|
|area|string|null: false|
|estimated_shipping_date|string|null: false|
### Association
- belongs_to :user
- belongs_to :large_category
- belongs_to :middle_category
- belongs_to :small_category
- belongs_to :brand

## large_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- has_many :products

## middle_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- has_many :products

## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- has_many :products

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- has_many :products

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
