Rails.application.routes.draw do
  root to: "bookings#index"
  devise_for :users
  resources :meeting_rooms
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
