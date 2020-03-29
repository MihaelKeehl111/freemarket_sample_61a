module ProductsHelper
  def first_image(product)
    images = Image.where(product_id: product.id)
    product_image = images.first
  end
end
