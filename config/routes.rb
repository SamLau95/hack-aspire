Rails.application.routes.draw do
  root to: 'pages#home'
  resource :test do
    member do
      post :submit
    end
  end
  devise_for :users
end
