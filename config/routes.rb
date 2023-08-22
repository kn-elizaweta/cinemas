Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :filter do
    collection do
      get "money"
    end
  end
  resources :cinemas
  resources :sessions do
    member do
    get "movie_session"
    end
    collection do
      get "money"
    end
  end
  resources :users do
    member do
      get "cinemas_name"
    end
  end
  resources :viewers do
    collection do
      put "update_status"
    end
  end
end

