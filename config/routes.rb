Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :recipe_types, only: %i[new create index show]
  resources :recipes, only: %i[new create edit update show] do
    resources :favorite_recipes, only: %i[create]
    resources :reviews, only: %i[new create]
  end

  resources :favorite_recipes, only: %i[index]
end
