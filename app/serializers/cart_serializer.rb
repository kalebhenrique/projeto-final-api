class CartSerializer < ActiveModel::Serializer
  attributes :id

  has_one :product

  has_one :user
end
