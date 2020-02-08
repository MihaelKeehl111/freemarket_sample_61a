class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postcode, presence: true, null: false
  validates :address, presence: true, null: false
  validates :prefecture, presence: true, null: false
  validates :municipality, presence: true, null: false
  validates :building, presence: true
end
