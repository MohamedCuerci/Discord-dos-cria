Rails.application.routes.draw do

  resources :rooms do
    resources :messages
  end

  root 'pages#home'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
