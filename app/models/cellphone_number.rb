class CellphoneNumber < ApplicationRecord
  belongs_to :user, optional: true
  validates :cellphone_number, presence: true, null: false, uniqueness: true
end
