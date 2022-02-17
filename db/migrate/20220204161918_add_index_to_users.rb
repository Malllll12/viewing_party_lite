class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    add_index :users, :email, unique: true

    add_column :users, :password_digest, :string

  end
end
