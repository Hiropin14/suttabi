Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/link'
  devise_for :users
  root to: "spots#index"
  resources :spots
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'welcome/index' => 'welcome#index'
  get 'wencome/link' => 'welcome#link'
end
