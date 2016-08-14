class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # accepts_nested_attributes_for :product

  def product_attributes=(pro_attributes)
    
    Product.create(name: pro_attributes["name"], minimum_quantity: pro_attributes["minimum_quantity"].to_i, price: pro_attributes["price"].to_f)
  end
end
