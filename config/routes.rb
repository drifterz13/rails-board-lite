Rails.application.routes.draw do
  devise_for :users
  resources :tasklists do
    resources :tasks
  end

  resources :tasks do
    member do
      patch "sort"
    end
  end

  resources :task_users, only: [:update]

  resources :rooms do
    patch "join", on: :member
    resources :messages
  end

  root "homes#index"
end
