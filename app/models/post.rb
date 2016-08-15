class Post < ApplicationRecord
  belongs_to :user
  has_one :product
  validates :title, presence: true

   accepts_nested_attributes_for :product

  # def product_attributes=(pro_attributes)
  #
  #   Product.create(name: pro_attributes["name"], minimum_quantity: pro_attributes["minimum_quantity"], price: pro_attributes["price"])
  # end
end
