class Project < ApplicationRecord
	has_and_belongs_to_many :skills
	has_many :users, through: :assigned_project 
	validates :name, length: { minimum: 2 }
  validates :start_date, :completion_date, presence: true
end
