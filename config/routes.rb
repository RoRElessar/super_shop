Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  concern :api_base do
    post 'authenticate', to: 'authentication#authenticate'
    post 'register', to: 'registrations#create'
  end

  namespace :v1 do
    concerns :api_base
  end
end
