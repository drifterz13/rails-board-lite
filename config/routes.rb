Rails.application.routes.draw do
  resources :tasks, only: [:show, :new, :index, :create, :destroy]

  root "tasks#index"
end
