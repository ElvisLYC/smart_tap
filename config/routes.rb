Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :show, :update, :edit] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  # get '/show' => "welcome#show"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/users/:id/add_device" => "users#device", as: 'add_device'

  post '/users/:id' => "users#edit"
end
