class Post < ApplicationRecord
  belongs_to :user
  has_one :product
  validates :title, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :product

  def product_attributes=(pro_attributes)
  
    product = Product.create(name: pro_attributes["name"], 
    	minimum_quantity: pro_attributes["minimum_quantity"], 
    	price: pro_attributes["price"])

    self.product = product #get product errors on post.save
  end
end
