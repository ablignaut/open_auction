Rails.application.routes.draw do
  devise_for :admin_users,
             skip: %I[password registrations],
             controllers: {
               sessions: 'admin/sessions'
             },
             path: '/admin',
             path_names: { sign_in: 'login' }

  devise_for :users,
             skip: %I[sessions registrations password],
             path: 'user'

  as :user do
    get 'user/sign_up', to: 'registrations#new', as: :new_user_registration
    post 'user', to: 'registrations#create', as: :user_registration
    get 'user/sign_in', to: 'sessions#new', as: :new_user_session
    post 'user/sign_in', to: 'sessions#create', as: :user_session
    delete 'user/sign_out', to: 'sessions#destroy', as: :destroy_user_session
  end

  root to: 'auctions#index'

  resources :auctions, only: %I[index show]
  resources :bids, only: [] do
    member do
      get :new
    end
  end

  # Admin namespace
  namespace :admin do
    root to: 'auctions#index'

    resources :auctions, only: %I[index new create]
  end
end
