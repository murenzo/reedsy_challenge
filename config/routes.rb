Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :products do
        resources :get_products, only: :index, path: '/'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
