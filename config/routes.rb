Rails.application.routes.draw do
  get 'users/show'
  devise_for :users,controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  authenticate(:user) do
    resources :users
  end

  # Defines the root path route ("/")
   root "welcomes#index"
   resources :welcomes, only: [:show]
    resources :registration_steps
  
end
