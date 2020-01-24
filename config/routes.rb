Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :custumers, only: [:index, :new, :create]
end
