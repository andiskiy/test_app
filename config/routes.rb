# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, path: 'admin'
  namespace :admin do
    resources :users

    get '/', to: 'users#index'
  end

  root 'admin/users#index'
end
