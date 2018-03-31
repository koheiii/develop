Rails.application.routes.draw do
  get 'favorites/index'

  get 'lives/index'

  root 'pages#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources 'users'
  resources 'favorites'

  post 'favorites/cancel_fav'

end
