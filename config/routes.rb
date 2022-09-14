Rails.application.routes.draw do

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources :programs do
    resources :reports
  end

  resources :programs do
    resources :scopes, except: %i[index]
  end

  get "/about", to: "pages#about", as: 'about'
  get "/contact", to: "pages#contact", as: 'contact'
  resources :programs

  resources :experts
  resources :companies
  devise_for :users
  root to: "pages#home"
  patch '/accept/:id', to: "reports#accept", as: 'accept'
  patch '/refuse/:id', to: "reports#refuse", as: 'refuse'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
