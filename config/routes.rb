Rails.application.routes.draw do
  resources :sessions
  root 'sessions#new'
  
  get 'welcome/index'

  resources :skills

  #get 'projects/show', to: 'assigned_projects#new', as: "assign_users"
  resources :projects 
 
  resources :users 
  root 'users#new'

  resources :assigned_projects
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

