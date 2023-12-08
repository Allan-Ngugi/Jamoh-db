Rails.application.routes.draw do
  resources :animals, only: [:index, :show, :create]
  resources :endangered_animal, only: [:index, :show, :create]
  resources :sightings, only: [:index, :show, :create]
end