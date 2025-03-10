Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: [:new, :create, :show, :edit, :update]
  get 'generate_cv', to: 'pdfs#generate_cv'

  # Custom homepage
  root to: "pages#home"

  # config/routes.rb
    Rails.application.routes.draw do
      get 'cv_data/:user_id', to: 'cv_data#show'
      # ... other routes ...
    end
end
