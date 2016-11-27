class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.integer :refers_to
      t.string :comment_user

      t.timestamps
    end
  end
end
