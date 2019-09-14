Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get 'profile' => "pages#profile", as: "profile"

  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
