Rails.application.routes.draw do
  devise_for :users

  patch '/tasks/:id/sort', to: "dnds#sort"

  resources :tasklists do
    resources :tasks
  end

  root "tasklists#index"
end
