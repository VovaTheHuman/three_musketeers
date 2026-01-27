class AddFieldsToAccounts < ActiveRecord::Migration[7.2]
  def change
    add_column :accounts, :username, :string
    add_index :accounts, :username, unique: true
    add_column :accounts, :email, :string
    add_index :accounts, :email, unique: true
    add_column :accounts, :password_digest, :string
    add_column :accounts, :display_name, :string
    add_column :accounts, :bio, :text
  end
end
