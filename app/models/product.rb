class Product < ApplicationRecord
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge
  belongs_to :delivery_method
  belongs_to :delivery_area
  belongs_to :delivery_date

  mount_uploader :image, ImageUploader

  validates :image, :name, :description, :category_id, :state_id, :delivery_charge_id, :delivery_method_id, :delivery_area_id, :delivery_date_id, :price, presence: true
end
