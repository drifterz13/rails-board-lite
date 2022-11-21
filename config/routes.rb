Rails.application.routes.draw do
  resources :tasklists do
    resources :tasks
  end

  root "tasklists#index"
end
