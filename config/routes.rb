Rails.application.routes.draw do
  resources :user_house_chores, only: [:new, :create]
  resources :bill_images
  resources :bill_payments
  resources :house_bills
  resources :house_users
  resources :houses
  resources :users
  resources :user_pets
  resources :mate_reviews
  resources :mate_profiles
  get '/',  to: 'static_pages#index'
  get '/login', to: 'users#login'
  post '/session', to: 'users#new_session'
  delete '/session', to: 'users#delete_session'
  get '/my_profile', to: 'users#my_profile'
  get '/my_house', to: 'houses#my_house'
  get '/sign_up', to: 'users#new'
  get '/join_house', to: 'houses#join'
  post '/join_house', to: 'house_users#join_house'
  post '/leave_house', to: 'house_users#leave_house'
  get '/users/:id/reviews', to: 'users#reviews'
  get '/houses/:id/all_bills', to: 'houses#all_bills'
  get '/houses/:id/invite_code', to: 'houses#invite_code'
  get '/houses/:id/unpaid_bills', to: 'houses#unpaid_bills'
  get '/houses/:id/chores', to: 'houses#chores'
  get '/my_share_history', to: 'house_users#my_history'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end