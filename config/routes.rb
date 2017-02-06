Rails.application.routes.draw do
  resources :loans, only: [:index, :show, :new, :create]

  match 'properties_list', to: 'owners#properties_list', via: [:get, :post]

  root to: 'loans#index'
end
