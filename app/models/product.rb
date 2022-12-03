class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :name, :price_in_cents, :category, :brand, :description, :inventory, presence: :true
  validates :name, uniqueness: :true
  validates :price_in_cents, :inventory, numericality: { only_integer: true, :greater_than_or_equal_to => 0}
end
