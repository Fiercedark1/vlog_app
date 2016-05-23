Rails.application.routes.draw do
  devise_for :users
  resources :videos
  resources :posts do
    resources :comments
  end

  devise_for :users do
    delete 'logout' => 'sessions#destroy', :as => :destroy_user_session
    get 'login' => 'devise/sessions#new'
  end
  get 'pages/about'

  get 'pages/contact'

  get 'posts/index' => 'posts#index'

  root 'videos#index'
end
