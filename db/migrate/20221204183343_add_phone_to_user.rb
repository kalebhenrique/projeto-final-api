class AddPhoneToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone, :string
    add_index :users, :phone, unique: true
  end
end
