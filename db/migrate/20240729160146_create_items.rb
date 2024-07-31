class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :desc
      t.decimal :price
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
