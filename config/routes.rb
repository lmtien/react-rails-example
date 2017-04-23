Rails.application.routes.draw do
  resources :importers
  resources :operations
  resources :statuses

  root :to => 'importers#index'

  get 'company' => "importers#index"

  post 'importers/csv' => 'importers#csv'
  get 'refresh' => 'importers#refresh'
end
