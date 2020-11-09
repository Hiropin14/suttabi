Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end

  root to: "spots#index"
  resources :spots, expect: [:index] do
   
   resource :favorites, only: [:create, :destroy]
   resources :comments, only: [:create]
  end
 
  post "likes/:spot_id"=>"likes#create",as:"like"
  delete "likes/:spot_id"=>"likes#destroy",as:"like_delete"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 

  get '/map_request', to: 'spots#map', as: 'map_request'
end
