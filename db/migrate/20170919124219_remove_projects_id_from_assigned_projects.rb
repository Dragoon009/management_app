class RemoveProjectsIdFromAssignedProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :assigned_projects, :projects_id, :integer
  end
end
