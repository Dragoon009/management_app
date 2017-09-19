class CreateAssignedProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :assigned_projects do |t|

      t.timestamps
    end
  end
end
