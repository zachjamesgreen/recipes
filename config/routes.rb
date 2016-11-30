Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :recipes
  get '/search' => 'app#search'

  get 'fav' => 'recipes#favorites', as: 'fav_recipes'

  post '/favorite/:id' => 'user#favorite', as: 'fav'
  delete '/favorite/:id' => 'user#remove_favorite', as: 'remove_fav'

  post '/comment' => 'comment#create'

  root to: 'app#index'
end
