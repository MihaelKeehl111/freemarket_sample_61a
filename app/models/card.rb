class Card < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :card_number, presence: true, null: false, numericality: true
  validates :expiration_month, presence: true, null: false, numericality: true
  validates :expiration_year, presence: true, null: false, numericality: true
  validates :security_code, presence: true, null: false, length: { in: 3..4 } 
end
