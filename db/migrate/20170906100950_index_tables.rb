class IndexTables < ActiveRecord::Migration[5.1]
  def change
  	add_index :projects, :name
  	add_index :users, :email
  	#add_index :projects_users, [:user_id, :project_id]  
  	add_index :skills_users, [:user_id, :skill_id]
  	add_index :projects_skills, [:skill_id, :project_id]
  end
end
