class CartSerializer < ActiveModel::Serializer
  attributes :id, :product

  def product
    {id: object.product.id, name: object.product.name, price_in_cents: object.product.price_in_cents}
  end
end
