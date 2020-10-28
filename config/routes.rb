Rails.application.routes.draw do
  get 'welcome/index'

  # Specify the root if needed
  root 'welcome#index'

  # creates a new resource with required endpoints
  # run rails routes in terminal
  resources :articles do
    resources :comments
  end
end
