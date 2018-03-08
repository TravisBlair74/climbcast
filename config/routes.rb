Rails.application.routes.draw do
  resources :areas

  get 'users/show'
  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
