class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :description, :title
  has_one :product
  belongs_to :user
end