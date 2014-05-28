GUT::Application.routes.draw do

  resources :association_attachments

  resources :association_tests

  get "users/show"
  post 'share/sendEmails/:id', to: 'share#sendEmails'

  devise_for :users

  resources :usertests do
  	member do
  		post :publish
      get :test
      get :share
  	end
  end

  resources :users
  resources :testmethods

  root to: "usertests#index"
end
