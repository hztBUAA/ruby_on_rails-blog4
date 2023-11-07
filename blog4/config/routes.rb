Rails.application.routes.draw do
  get 'users/index'
  devise_scope :user do
    get 'users/:id', to: 'users#show', as: :user
  end
  # resources :users do
  #   collection do
  #     get 'login'
  #     post 'do_login'
  #     get 'logout'
  #   end
  # end
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  devise_for :users


   #resources :comments
  resources :blogs do
    resources :comments
  end
  root to:'blogs#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
