# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'users#index'

  resources :users do
    resources :messages, only: %i[show create]
    member do
      get 'favored'
      get 'match'
      get 'result'
      get 'first'
      patch 'type'
    end
  end
  resources :relations, only: %i[create destroy]
  namespace :api do
    resources :relations, only: :index
  end
end
