Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    root to: 'devise/registrations#new'
  end

  resource :page, only: [], controller: 'pages' do
    collection do
      get :done
    end
  end

  resources :teachers, only: [] do
    collection do
      get :analytics
      get :students
    end
  end

  resource :test, only: :show do
    member do
      post :submit
    end
  end
end
