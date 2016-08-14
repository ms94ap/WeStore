class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end
end
