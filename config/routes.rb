Rails.application.routes.draw do

  root 'videos#index'

  devise_for :users
  resources :videos
  resources :posts do
    resources :comments
  end

  get 'pages/about'

  get 'pages/contact'

  get 'videos/index' => 'videos/#index'

  #get 'posts/index' => 'posts#index'
end
