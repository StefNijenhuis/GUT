GUT::Application.routes.draw do

  get "users/show"
  post 'usertests/action'
  devise_for :users
  resources :usertests
  resources :users

  root to: "usertests#index"
end
