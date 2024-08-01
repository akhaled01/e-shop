class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items

  validates :name, presence: true

  # Add an item to the cart
  def add_item(item, quantity = 1)
    cart_item = cart_items.find_by(item:)

    if cart_item
      cart_item.increment!(:quantity, quantity)
    else
      cart_items.create(item:, quantity:)
    end
  end

  # Remove an item from the cart
  def remove_item(item)
    cart_item = cart_items.find_by(item:)
    cart_item&.destroy
  end
end
