Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
      # get 'reviews/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
