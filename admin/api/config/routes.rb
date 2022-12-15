Rails.application.routes.draw do
  resources :users
  resources :skills
  post "/users", to: "users#signup"
  post "/users/login", to: "users#login_handler"
  resources :projects, param: :slug
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
