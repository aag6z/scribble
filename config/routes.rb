Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :comments
  end

  resources :tags

  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#sign_in!'
  get '/sign_up', to: 'users#sign_up'
  post '/sign_up', to: 'users#sign_up!'
  get '/sign_out', to: 'users#sign_out'

  # get "posts" => "posts#index"
  # get "posts/new" => "posts#new"
  # post "posts" => "posts#create"
  # get "posts/:id" => "posts#show"
  # get "posts/:id/edit" => "posts#edit"
  # put "posts/:id" => "posts#update"
  # delete "posts/:id" => "posts#destroy"
  #
  # get "comments/new" => "comments#new"
  # post "comments" => "comments#create"
  # get "comments/:id" => "comments#show"
  # get "comments/:id/edit" => "comments#edit"
  # put "comments/:id" => "comments#update"
  # delete "comments/:id" => "comments#destroy"

end
