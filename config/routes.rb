Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get 'profile' => "pages#profile", as: "profile"

  resources :courses
  resources :courses, only: [:show] do
    resources :office_hours, only: [:create, :destroy]
  end
  resources :office_hours

  resources :tasks
end
