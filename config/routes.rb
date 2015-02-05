Rails.application.routes.draw do
  get '/hello', to: 'application#index'
  root to: 'application#index'
end
