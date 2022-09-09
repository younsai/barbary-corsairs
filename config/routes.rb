Rails.application.routes.draw do

  get '/my_programs', to: 'programs#my_programs', as: 'my_programs'
  resources :programs do
    resources :reports
  end

  get "/about", to: "pages#about", as: 'about'

  resources :experts
  resources :companies
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
