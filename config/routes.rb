Rails.application.routes.draw do
  resources :videos
  resources :posts do
    resources :comments
  end
  get 'pages/about'

  get 'pages/contact'

  get 'posts/index' => 'posts#index'

  root 'videos#index'
end
