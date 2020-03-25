Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  concern :api_base do
    namespace :admin do
      resources :categories, except: %i[new edit]
    end
    post 'authenticate', to: 'authentication#authenticate'
    post 'register', to: 'registrations#create'
  end

  namespace :v1 do
    concerns :api_base
  end
end
