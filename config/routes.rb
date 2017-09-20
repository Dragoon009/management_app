Rails.application.routes.draw do
  resources :sessions
  resources :skills
  resources :projects
  resources :users
  resources :assigned_projects

  root 'welcome#index'

end
