GUT::Application.routes.draw do

  get "users/show"
  devise_for :users
  resources :usertests
  resources :users
  resources :testmethods

  root to: "usertests#index"
end
