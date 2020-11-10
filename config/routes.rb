Rails.application.routes.draw do
  
  devise_for :users
  #マイページについて
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
    get :likes
  end

  root to: "spots#index"
  resources :spots, expect: [:index] do
  end
 
  post "likes/:spot_id"=>"likes#create",as:"like"
  delete "likes/:spot_id"=>"likes#destroy",as:"like_delete"

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/map_request', to: 'spots#map', as: 'map_request'
end
