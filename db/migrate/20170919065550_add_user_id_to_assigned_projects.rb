class AddUserIdToAssignedProjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :assigned_projects, :users, foreign_key: true
  end
end
