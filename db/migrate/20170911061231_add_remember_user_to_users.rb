class AddRememberUserToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :remember_user, :string
  end
end
