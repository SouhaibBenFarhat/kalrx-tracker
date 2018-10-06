Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  post 'visit/init', to: 'visit#init'
  post 'visit/ping', to: 'visit#ping'
  get 'visit', to: 'visit#visits'
end
