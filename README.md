# メルカリデータベース設計
## uers
|column|type|options|
|-------------------|
|nickname|string|null: false, unique: true|
|email|string|null: false,unique: true|
|password|string|null: false, unique: true|
|name|string|null: false|
|name(kana)|string|null: false|
|birthday|string|null: false|
|cellephone-number|string|null: false|
|streetadress|string|null: false|
|cardnumber|string|null: false|
|securitycord|string|null: false|
### association
- has_many :products
- has_many :comments

## products
|column|type|options|
|-------------------|
|name|string|null: false|
|size|string|null: false|
|image|text|null: false|
|description|text|null: false|
|state|string|null: false|
|price|string|null: false|
|category|refarence|null: false, foreign_key: true|
|user|refarence|null: false, foreign_key: true|
|brand|refarence|null: false, foreign_key: true|
### association
- belongs_to :users
- belongs_to :category
- belongs_to :brands

## category
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
### association
- belongs_to :users