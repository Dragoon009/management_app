class AssignedProject < ApplicationRecord
	attr_accessor :user_id, :project_id
	belongs_to :users
	belongs_to :projects

end