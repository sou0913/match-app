# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'users#index'
  get "/healthcheck" => "alb#healthcheck"
  resources :users do
    resources :messages, only: %i[show create]
    namespace :api do
      resources :messages, only: :index
    end
    member do
      get 'favor'
      get 'be_favored'
      get 'match'
      get 'result'
      get 'first'
      patch 'type'
    end
    collection do
      get 'search'
    end
  end
  resources :relations, only: %i[create destroy]
  namespace :api do
    resources :users, only: :index
    resources :relations, only: :index
  end
end
