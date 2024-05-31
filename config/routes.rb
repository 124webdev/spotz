Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "pages/profile", to: "pages#profile"

  resources :bookmarks, only: %i[index destroy]
  resources :links, only: %i[new crate]

  resources :spots, only: %i[index show] do
    get "create_visit", to: "spots#create_visit"
    get "delete_visit", to: "spots#delete_visit"
    get "create_bookmark", to: "spots#create_bookmark"
    get "delete_bookmark", to: "spots#delete_bookmark"
    get "options", to: "spots#options"
    # resources :bookmarks, only: %i[create]
    resources :reviews, only: %i[new create index edit update destroy]
    resources :links, only: %i[new create destroy]
  end

  resources :experiences, only: %i[index show] do
    resources :reviews, only: %i[new create index edit update destroy]
    resources :links, only: %i[index create show]
  end
end
