GUT::Application.routes.draw do

  get 'share/sendEmails/:id', to: 'share#index', as: 'shareEmail'

  get "users/show"
  post 'share/sendEmails/:id', to: 'share#sendEmails'

  devise_for :users

  resources :usertests do
  	member do
  		put :publish
  	end
  end
  
  resources :users

  root to: "usertests#index"
end
