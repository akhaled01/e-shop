class AddUserFieldToItem < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :items, :users, column: :user_id
  end
end
