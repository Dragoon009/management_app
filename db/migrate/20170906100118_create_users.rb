class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :role
    	t.string :name
    	t.string :email
    	t.string :encrypted_password
      t.timestamps
    end
  end
end
