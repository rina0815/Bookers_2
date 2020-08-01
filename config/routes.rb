Rails.application.routes.draw do
  root 'homes#home'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
