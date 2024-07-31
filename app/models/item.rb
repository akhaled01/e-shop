class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :desc, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
  validates :user_id, presence: true
end
