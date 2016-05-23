Rails.application.routes.draw do
  resources :videos, :posts
  get 'pages/about'

  get 'pages/contact'

  get 'posts/index' => 'posts#index'

  root 'videos#index'
end
