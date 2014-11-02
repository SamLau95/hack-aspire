Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # TODO: Replace
  get '/home', to: 'pages#home', as: :home
end
