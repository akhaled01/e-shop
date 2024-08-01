class Item < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :carts, through: :cart_items
  
  validates :name, presence: true
  validates :desc, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
  validates :user_id, presence: true
end
