class AddUserRefToAssignedProjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :assigned_projects, :user, foreign_key: true
  end
end
