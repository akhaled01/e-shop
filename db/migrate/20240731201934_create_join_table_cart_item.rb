class CreateJoinTableCartItem < ActiveRecord::Migration[7.1]
  def change
    create_join_table :carts, :items do |t|
      t.index :cart_id
      t.index :item_id
    end
  end
end
