Rails.application.routes.draw do
  root to: 'pages#home'
  resource :test
  devise_for :users
end
