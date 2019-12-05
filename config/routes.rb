Rails.application.routes.draw do
  devise_for :users
  root 'videos#index'
  get  'videos/new' => 'videos#new'
  post 'videos'     => 'videos#create'
end
