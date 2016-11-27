class CreateRecipesProducts < ActiveRecord::Migration
  def change
    create_table :recipes_products do |t|
      t.integer :recipe_id
      t.integer :recipe_prod_id

      t.timestamps
    end
  end
end
