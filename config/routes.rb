Rails.application.routes.draw do
  devise_for :users

  resources :tasklists do
    resources :tasks
  end

  root "tasklists#index"
end
