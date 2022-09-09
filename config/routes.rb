Rails.application.routes.draw do
  get "/about", to: "pages#about", as: 'about'
  get "/contact", to: "pages#ontact", as: 'contact'
  resources :programs
  resources :experts
  resources :companies
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
