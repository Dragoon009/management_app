class AddProjectIdToAssignedProjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :assigned_projects, :projects, foreign_key: true
  end
end
