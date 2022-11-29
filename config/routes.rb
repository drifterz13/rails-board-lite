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

  root "tasklists#index"
end
