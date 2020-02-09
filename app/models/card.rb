class Card < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :card_number, presence: true, null: false, on: :create
  validates :expiration_month, presence: true, null: false, on: :create
  validates :expiration_year, presence: true, null: false, on: :create
  validates :security_code, presence: true, null: false, on: :create
end
