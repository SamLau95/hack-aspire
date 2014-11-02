Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    root to: 'devise/registrations#new'
  end
  get '/done', to: 'pages#done', as: :done
  get '/analytics', to: 'pages#analytics', as: :analytics
  resource :test do
    member do
      post :submit
    end
  end
end
