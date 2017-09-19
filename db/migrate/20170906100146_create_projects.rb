class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
    	t.string :name
    	t.datetime :start_date
    	t.datetime :completion_date
      t.timestamps
    end
  end
end
