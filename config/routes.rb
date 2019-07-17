Rails.application.routes.draw do
  resources :foods
  resources :alcohols
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'foods#new'

  get '/dashboard'=>  'dashboards#index'
  
end
