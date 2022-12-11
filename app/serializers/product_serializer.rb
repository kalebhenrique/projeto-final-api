class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price_in_cents, :inventory

  has_one :brand
  has_one :category
end
