Rails.application.routes.draw do

  root 'videos#index'

  devise_for :users
  resources :videos
  resources :ytapi
  resources :posts do
    resources :comments
  end

  get 'pages/about'

  get 'pages/contact'

  get 'ytapi/index'  => 'ytapi/#index'

  get 'videos/index' => 'videos/#index'

  #get 'posts/index' => 'posts#index'
end
