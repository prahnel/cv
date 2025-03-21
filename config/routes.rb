Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users do
      resources :cvs
    end
    root 'users#show'

  # config/routes.rb
    Rails.application.routes.draw do
      get 'cv_data/:user_id', to: 'cv_data#show'
      # Add your test route here:
      get '/test_tailwind', to: 'pages#test_tailwind'
      # ... other routes ...
    end
end
