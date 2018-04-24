Rails.application.routes.draw do
  root :to => "messages#index"
  post "/messages" => "messages#create"
  get "/register" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  mount ActionCable.server => '/cable'
end
