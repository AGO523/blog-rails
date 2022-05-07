Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts do
    resources :comments, only: %i[create]
  end
  
  resources :salons do
    patch :toggle_status
  end

  
  # match "*path" => "application#error404", via: :all
end
