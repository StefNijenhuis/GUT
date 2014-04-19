GUT::Application.routes.draw do

  get "users/show"
  devise_for :users
  resources :usertests
  resources :users

  root to: "usertests#index"
end
