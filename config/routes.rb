Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "homes#index"

  resources :articles
  get  'signup',to: 'users#new'
  resources :users, except:[:new]
  get 'login', to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
