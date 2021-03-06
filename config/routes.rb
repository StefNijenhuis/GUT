GUT::Application.routes.draw do

  get "users/show"
  post 'share/sendEmails/:id', to: 'share#sendEmails'

  devise_for :users

  resources :usertests do
  	member do
  		post :publish
      get :test
      get :share
      get :export
  	end
  end

  resources :users
  resources :results
  resources :testpeople

  root to: "usertests#index"
end
