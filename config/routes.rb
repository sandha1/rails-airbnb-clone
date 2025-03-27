Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"

  resources :flats

  get "/my_flats", to: "pages#my_flats"
end
