Rails.application.routes.draw do
  root 'urls#index'
  resources :urls
  namespace :api do
    namespace :v1 do
      resources :urls
    end
  end
end
