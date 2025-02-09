Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: [:new, :create, :show, :edit, :update]
  get 'generate_cv', to: 'pdfs#generate_cv'
  # Custom homepage
  root to: "pages#home"
end
