Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get 'profile' => "pages#profile", as: "profile"

  resources :courses
  resources :courses, only: [:show] do
    resources :office_hours, only: [:create]
  end
  resources :office_hours
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
