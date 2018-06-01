Rails.application.routes.draw do
  root 'urls#index'
  resources :urls do
  	post :create_url_csv, on: :collection
  end
  namespace :api do
    namespace :v1 do
      resources :urls
    end
  end
end
