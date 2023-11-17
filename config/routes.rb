Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'dashboard', to: 'dashboard#index'

  resources :recipes, except: [ :show ]

  resources :shopping_items, only: [ :create, :show, :edit, :update, :destroy ] do
    member do
      post 'toggle_stock'
    end
  end
  get 'search_shopping_items', to: 'shopping_items#search'

  resources :shopping_categories

  resource :scratchpad, only: [:update]


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "dashboard#index"
end
