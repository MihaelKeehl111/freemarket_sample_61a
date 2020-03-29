class Image < ApplicationRecord
  belongs_to :product
  mount_uploader :image, ImageUploader

  def set_first_image
    images = Image.where(product_id: product.id)
    product_image = images.first
  end
end
