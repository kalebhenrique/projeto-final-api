class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :carts, dependent: :destroy
    validates :credit, :name, presence: :true
    validates :name, length: { minimum: 3, maximum: 30 }
    validates :is_admin, inclusion: [true, false], exclusion: [nil]
    validates :credit, numericality: { only_integer: true, :greater_than_or_equal_to => 0}
end
