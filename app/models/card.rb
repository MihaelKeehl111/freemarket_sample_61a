class Card < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :card_number, presence: true, numericality: true
  validates :expiration_month, presence: true, numericality: true
  validates :expiration_year, presence: true, numericality: true
  validates :security_code, presence: true, length: { in: 3..4 } 
end
