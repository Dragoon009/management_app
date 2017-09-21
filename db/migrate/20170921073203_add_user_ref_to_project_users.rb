class AddUserRefToProjectUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :project_users, :user, foreign_key: true
  end
end
