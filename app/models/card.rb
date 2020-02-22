class Card < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :card_number, :expiration_month, :expiration_year, presence: true, numericality: true
  validates :security_code, presence: true, length: { in: 3..4 } 
end
