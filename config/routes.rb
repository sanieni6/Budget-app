Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
  # if user_signed_in?
  #   root "groups#index"
  # else
  #end
  root "groups#index"
  resources :groups, path: 'category', only: [:index, :show,  :new, :create, :destroy] do
    resources :operations, only: [:index, :new, :create, :destroy]
  end
end
