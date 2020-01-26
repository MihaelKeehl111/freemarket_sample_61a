# メルカリデータベース設計
## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false,unique: true|
|password|string|null: false, unique: true|
|familyname|string|null: false|
|familyname(kana)|string|null: false|
|firstname|string|null: false|
|firstname(kana)|string|null: false|
|birthday|string|null: false|
|cellphone-number|string|null: false|
|phone-number|integer||
|profile|text||
|profile-image|text||
### association
- has_many :products
- has_many :comments
- has_many :users_rates
- has_many :likes
- has_one :streetaddress
- has_one :card


## products
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size|string|null: false|
|description|text|null: false|
|state|string|null: false|
|price|string|null: false|
|delivery-charge|string|null: false|
|delivery-method|string|null: false|
|delivery-area|string|null: false|
|delivery-date|string|null: false|
|category|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
|brand|reference|null: false, foreign_key: true|
### association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :comments
- has_many :likes
- has_many :images

## likes
|Column|Type|Options|
|------|----|-------|
|user|reference||null: false, foreign_key: true|
|product|reference|null: false, foreign_key: true|
### assosiation 
- belongs_to :user
- belongs_to :product

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### association
- has_many :products
- has_ancestry


## brands
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### association
- has_many :products

## comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user|reference|null: false, foreign_key: true|
|product|reference|null: false, foreign_key: true|
### association
- belongs_to :user
- belongs_to :product

## streetaddresses
|Column|Type|Options|
|------|----|-------|
|postcode|integer|null: false|
|prefecture|string|null: false|
|Municipalities|string|null: false|
|adress|string|null: false|
|building|string||
|user|refarence|null: false, foreign_key: true|
### association
- belongs_to :user

## images
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|product|refarence|null: false, foreign_key: true|
### association
- belongs_to :product
- belongs_to :user
