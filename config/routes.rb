Rails.application.routes.draw do

  resources :areas do
    resources :comments, except: [:index]
  end

  get 'users/show'
  devise_for :users

  get 'about' => 'welcome#about'

  root 'areas#index'
end
