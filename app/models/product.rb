class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :name, :price, :category, :brand, :description, :inventory, presence: :true
  validates :name, uniqueness: :true
  validates :price, :inventory, numericality: { only_integer: true, :greater_than_or_equal_to => 0}
end
