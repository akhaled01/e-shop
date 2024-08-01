class AddQuantityToCartsItems < ActiveRecord::Migration[7.1]
  def change
    add_column :carts_items, :quantity, :integer, default: 1
  end
end
