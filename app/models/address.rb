class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :postcode, presence: true, null: false, on: :validates_step3
  validates :address, presence: true, null: false, on: :validates_step3
  validates :prefecture, presence: true, null: false, on: :validates_step3
  validates :municipality, presence: true, null: false, on: :validates_step3
  validates :building, presence: true, on: :validates_step3
end
