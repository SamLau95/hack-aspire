Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    root to: 'devise/registrations#new'
  end
  # TODO: Replace
  get '/home', to: 'pages#home', as: :home
  resource :test do
    member do
      post :submit
    end
  end
end
