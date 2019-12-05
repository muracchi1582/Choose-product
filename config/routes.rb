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

  get "/products" => "products#index"
end
