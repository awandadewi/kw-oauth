Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  # Doorkeeper
  use_doorkeeper

  # Devise
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Developers
  namespace :developers do
    get "/", to: 'apps#index'
    resources :apps do
      member do
        post :generate_own_token
        delete :revoke_token
      end
    end
  end

end
