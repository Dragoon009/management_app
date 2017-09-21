Rails.application.routes.draw do
  resources :sessions
  resources :skills
  resources :projects
  resources :users
  resources :project_users

  root 'welcome#index'

end
