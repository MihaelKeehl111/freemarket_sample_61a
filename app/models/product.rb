class Product < ApplicationRecord
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge
  belongs_to :delivery_method
  belongs_to :delivery_area
  belongs_to :delivery_date
end
