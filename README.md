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
|price|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
