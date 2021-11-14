Rails.application.routes.draw do
  resources :musics
  resources :users
  root 'users#index'
end
