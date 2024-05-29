Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :spots, only: %i[index show]
end
