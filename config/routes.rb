GUT::Application.routes.draw do

  get "users/show"
  devise_for :users
  resources :usertests do
  	member do
  		post :publish
  	end
  end
  resources :users


  root to: "usertests#index"
end
