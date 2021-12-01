Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
  get '/', to: 'application#index'
  post '/create', to: 'application#create'
  get '/:shortened_path', to: 'application#to'
end
