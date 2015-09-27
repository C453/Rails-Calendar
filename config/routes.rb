Rails.application.routes.draw do
  resources :users
  resources :events

    get "/log-in" => "sessions#new"
    post "/log-in" => "sessions#create"
    get "/log-out" => "sessions#destroy", as: :log_out
    get "/register" => "users#new"

   get '/' => 'calendar#index'
end
