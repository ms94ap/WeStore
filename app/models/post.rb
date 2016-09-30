class Post < ApplicationRecord
  belongs_to :user
  has_one :product
  has_many :comments
  has_many :users, through: :comments
  validates :title, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :product


  scope :most_recent, ->{ order(created_at: :desc) }

  # def self.most_recent
  #   order(created_at: :desc)
  # end

  def product_attributes=(pro_attributes)
  
    product = Product.create(name: pro_attributes["name"], 
    	minimum_quantity: pro_attributes["minimum_quantity"], 
    	price: pro_attributes["price"])
    product.categories << Category.find(pro_attributes["category"])

    self.product = product #get product errors on post.save
  end

  def last_updated
    updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
  end

end
