Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  root 'songs#index'
end
