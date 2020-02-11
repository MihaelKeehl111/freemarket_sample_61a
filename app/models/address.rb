class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :postcode, presence: true
  validates :address, presence: true
  validates :prefecture, presence: true
  validates :municipality, presence: true
end
