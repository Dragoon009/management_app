class RemoveUsersIdFromAssignedProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :assigned_projects, :users_id, :integer
  end
end
