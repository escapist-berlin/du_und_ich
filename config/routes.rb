Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :ads, only: [:index]

  resources :phrases, only: [:index, :show] do
    member do
      get :ads
    end
  end
end
