class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :prod_name
      t.integer :quantity
      t.string :mesure_unit

      t.timestamps
    end
  end
end
