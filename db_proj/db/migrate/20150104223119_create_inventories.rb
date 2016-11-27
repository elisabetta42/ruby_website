class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :owner_user_name
      t.integer :product_id

      t.timestamps
    end
  end
end
