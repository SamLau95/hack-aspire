Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :teachers, only: [] do
    collection do
      get :analytics
    end
  end

end
