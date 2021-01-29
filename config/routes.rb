Rails.application.routes.draw do
  mount OpenApi::Rswag::Ui::Engine => '/api-docs'
  mount OpenApi::Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      constraints format: :json do
        resources :gallery_items, only: [:index]
        resources :movies, only: [:index]
        resources :seasons, only: [:index]
        resources :users, only: [:create]
      end
    end
  end

end
