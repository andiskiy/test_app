# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, path: 'admin'
  namespace :admin do
    resources :users

    get '/', to: 'users#index'
  end

  devise_for :users, skip: :all

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        scope '/', defaults: { format: :json } do
          post   'users/sign_in',  to: 'account/sessions#create'
          delete 'users/sign_out', to: 'account/sessions#destroy'
          post   'users/sign_up',  to: 'account/registrations#create'
          put    'account',        to: 'account/registrations#update'
          delete 'account',        to: 'account/registrations#destroy'
          get    'account',        to: 'account/registrations#edit'
        end
      end
    end
  end

  root 'admin/users#index'
end
