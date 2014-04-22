GUT::Application.routes.draw do

  get "users/show"
  devise_for :users
  resources :usertests do
  	member do
  		get :publish
  	end
  end
  resources :users


  root to: "usertests#index"
end
