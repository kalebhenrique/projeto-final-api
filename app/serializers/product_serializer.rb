class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :price_in_cents, :inventory, :images_url

  has_one :brand
  has_one :category

  def images_url
    array = []
      if object.images.attached?
        object.images.each do |image|
           array.append rails_blob_path(image, only_path: true)
        end
      end
      array
  end
end
