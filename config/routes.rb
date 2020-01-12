# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, path: 'admin'
  # devise_for :users

  resources :users

  root 'users#index'
end
