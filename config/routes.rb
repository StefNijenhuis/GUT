GUT::Application.routes.draw do

  get "users/show"
  post 'share/sendEmails/:id', to: 'share#sendEmails'

  devise_for :users

  resources :usertests do
  	member do
  		post :publish
  	end
  end
  
  resources :users

  root to: "usertests#index"
end
