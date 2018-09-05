Rails.application.routes.draw do
  resources :user_house_chores
  resources :chores, only: %i[show]
  resources :bill_images, only: %i[create show]
  resources :bill_payments, except: %i[index destroy]
  resources :house_bills, except: %i[index destroy]
  resources :house_users, only: %i[update show create]
  resources :houses, except: %i[index destroy] 
  resources :users
  resources :user_pets, except: %i[index]
  resources :mate_reviews, except: %i[index]
  resources :mate_profiles, except: %i[index destroy]
  get '/login', to: 'users#login'
  get '/my_profile', to: 'users#my_profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end