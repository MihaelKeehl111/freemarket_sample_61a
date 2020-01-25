# メルカリデータベース設計
## uers
|column|type|options|
|-------------------|
|nickname|string|null: false, unique: true|
|email|string|null: false,unique: true|
|password|string|null: false, unique: true|
|familyname|string|null: false|
|name(kana)|string|null: false|
|firstname|string|null: false|
|firstname(kana)|string|null: false|
|birthday|string|null: false|
|cellephone-number|string|null: false|
|postcode|string|null: false|
|prefecture|string|null: false|
|Municipalities|string|null: false|
|adress|string|null: false|
|building|string||
|phone-number|string||
|cardnumber|string|null: false|
|expiration-month|string|null: false|
|expiration-year|string|null: false|
|securitycord|string|null: false|
|profile|text||
|profile-image|text||
### association
- has_many :products
- has_many :comments
- has_many :users_rates
- has_many :likes


## products
|column|type|options|
|-------------------|
|name|string|null: false|
|image|text|null: false|
|size|string|null: false|
|image|text|null: false|
|description|text|null: false|
|state|string|null: false|
|price|string|null: false|
|delibary-charge|string|null: false|
|delibary-method|string|null: false|
|delibary-area|string|null: false|
|delibary-date|string|null: false|
|category1|refarence|null: false, foreign_key: true|
|category2|refarence|null: false, foreign_key: true|
|category3|refarence|null: false, foreign_key: true|
|user|refarence|null: false, foreign_key: true|
|brand|refarence|foreign_key: true|
### association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :comments
- has_many :likes

## likes
|user|refarence|foreign_key: true|
|product|refarence|foreign_key: true|
### assosiation 
- belongs_to :user
- belongs_to :product

## categorys
|column|type|options|
|-------------------|
|name|string|null: false|
|product|refarence|foreign_key: true|
- has_many :products

## brands
|column|type|options|
|-------------------|
|name|string|null: false|
|product|refarence|foreign_key: true|
- has_many :products

## comments
|column|type|options|
|-------------------|
|comment|text|null: false|
|user|refarence|foreign_key: true|
|product|refarence|foreign_key: true|
### association
- belongs_to :user
- belongs_to :product

