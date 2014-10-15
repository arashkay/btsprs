Rails.application.routes.draw do

  devise_for :admins

  root 'general#index'
  resources :templates

end
