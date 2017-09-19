class IndexSkillTable < ActiveRecord::Migration[5.1]
  def change
  	add_index :skills, :skill
  end
end
