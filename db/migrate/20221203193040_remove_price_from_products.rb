class RemovePriceFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :price, :integer
  end
end
