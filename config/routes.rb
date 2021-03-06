Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users,  only: [:create, :show, :update]
      resources :logins, only: [:create]
      resources :places, only: [:create, :index] do
        resources :reviews, only: [:create, :index]
      end
    end
  end
end
