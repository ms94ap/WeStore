class ProductSerializer < ActiveModel::Serializer
	attributes :name, :minimum_quantity, :price
	has_many :categories
end