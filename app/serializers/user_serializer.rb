
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :email
  has_many :posts
end