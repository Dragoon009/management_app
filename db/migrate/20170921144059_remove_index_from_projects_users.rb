class RemoveIndexFromProjectsUsers < ActiveRecord::Migration[5.1]
  def change
    remove_index :projects_users, [:user_id, :project_id]
  end
end
