class CreateRecipeProds < ActiveRecord::Migration
  def change
    create_table :recipe_prods do |t|
      t.integer :recipes_id
      t.integer :prods_id

      t.timestamps
    end
  end
end
