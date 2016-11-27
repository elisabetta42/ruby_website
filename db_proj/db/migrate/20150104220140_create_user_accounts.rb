class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts, id: false do |t|
      t.primary_key :id, :string
      t.string :password
      t.string :email
      t.integer :level

      t.timestamps
    end
  end
end
