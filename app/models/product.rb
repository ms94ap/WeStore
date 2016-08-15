class Product < ApplicationRecord
  belongs_to :user
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :name, :minimum_quantity, :price, presence: true

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end
end
