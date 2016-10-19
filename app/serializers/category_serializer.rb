class CategorySerializer < ActiveModel::Serializer
	attributes :name, :id
	has_many :products
	# μπορεί  να χρειαστεί να το αφαιρέσεις το has_many έχε το νου σου.!!!!!!
end