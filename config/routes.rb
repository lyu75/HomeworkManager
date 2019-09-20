Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  get 'profile' => "pages#profile", as: "profile"

  resources :courses
  resources :office_hours
  resources :tasks

  put 'complete/:id', to: 'tasks#mark_complete', as: :complete_task
  put 'incomplete/:id', to: 'tasks#mark_incomplete', as: :incomplete_task

  resources :courses, only: [:show] do
    resources :office_hours, only: [:create]
    resources :tasks, only: [:new, :create]
  end
end
