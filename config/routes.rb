Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"

  resources :flats do
    resources :bookings, only: [:create]
  end

  get "/my_flats", to: "pages#my_flats"
  get "/my_bookings", to: "pages#my_bookings"
end
