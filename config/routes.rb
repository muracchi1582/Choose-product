Rails.application.routes.draw do
    devise_for :users
    root 'videos#index'
    resources :videos do
      resources :products, only: [:show]
      collection do
        get 'search'
        get 'genre'
    end
  end
  resources :users, only: [:index,:show]
  resources :genres, only: [:index,:show,:new]

  get "/products" => "products#index"
  post "products/:id/pay" => 'products#pay', as: :products_pay
  get "users/:id/history" => "users#history"
end
