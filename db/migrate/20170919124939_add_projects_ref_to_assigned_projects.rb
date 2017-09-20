class AddProjectsRefToAssignedProjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :assigned_projects, :project, foreign_key: true
  end
end
