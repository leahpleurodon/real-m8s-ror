Rails.application.routes.draw do
  resources :user_house_chores
  resources :chores
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end