GUT::Application.routes.draw do

  get "users/show"
  post 'usertests/update_status'
  devise_for :users
  resources :usertests
  resources :users

  root to: "usertests#index"
end
