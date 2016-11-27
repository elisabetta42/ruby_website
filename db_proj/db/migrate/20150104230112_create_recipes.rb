class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.text :description
      t.string :recipe_writer

      t.timestamps
    end
  end
end
