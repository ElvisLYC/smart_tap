require 'sidekiq/web'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :subscriptions, only: [:index]

  get '/users/:id/checkout' => "subscriptions#show", as: 'pay_subs'
  resources :users, controller: "users", only: [:create, :show, :update, :edit] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  # get '/show' => "welcome#show"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/users/:id/add_device" => "devices#new", as: 'devices'
  get "/users/:id/new_subscription" => "subscriptions#new", as: 'new_subscription'

  post '/users/:id' => "users#edit"


  get 'subscriptions/checkout'
  post 'subscriptions/checkout'

  # post "/users/:id/new_subscription" => "subscriptions#checkout"

  post '/users/:id/new_subscription' => "subscriptions#create", as: 'create_subs'

  # Schedule a new Task
  resources :users, controller: "users", only: [:create, :show, :update, :edit] do
    resources :tasks
  end
  post '/users/:id/task/new' => "tasks#create", as: 'create_task'
  delete '/users/:id/task/:id/delete' => "tasks#destroy", as: 'destroy_task'
  get '/users/:id/task/:id/edit' => "tasks#edit", as: 'edit_task'
  post '/users/:id/task/:id/update' => "tasks#update", as: 'update_task'
  # post '/users/:id/new_task' => "tasks#create"
  # get '/task', to: 'ssh_commands#ssh_send', as: 'task'

  # get '/users/:id/checkout' => "subscriptions#show"


  # get '/users/:id' => "subscriptions#show"

  # Cross Origin problem
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]

  mount Sidekiq::Web => '/sidekiq'


end
