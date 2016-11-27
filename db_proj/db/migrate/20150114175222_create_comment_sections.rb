class CreateCommentSections < ActiveRecord::Migration
  def change
    create_table :comment_sections do |t|
      t.integer :recipe_section_id
      t.integer :section_comment_id

      t.timestamps
    end
  end
end
