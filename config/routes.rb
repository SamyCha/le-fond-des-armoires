Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    resources :products, only: [ :new, :create ]
    end
  resources :products

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
