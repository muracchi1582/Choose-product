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

    resources :users, only: [:index,:show] do
      member do 
        post 'pay'
        get 'history'
        get 'profit'
      end
    end

    resources :genres, only: [:index,:show,:new]

    get "/products" => "products#index"
end
