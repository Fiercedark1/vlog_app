Rails.application.routes.draw do

  root 'videos#index'
  ActiveAdmin.routes(self)
  devise_for :users
  resources :videos
  resources :posts do
    resources :comments
  end

  get 'pages/about'

  get 'pages/contact'

  get 'posts/index' => 'posts#index'
end
