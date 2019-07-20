Rails.application.routes.draw do
  resources :foods
  resources :alcohols

  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'alcohols#index'

  get '/dashboard'=>  'dashboards#index'
  get '/foods_edit' => 'foods#index_edit'
  get '/alcohols_edit' => 'alcohols#index_edit'

end
