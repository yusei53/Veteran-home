# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'

  resources :areas, :stores, :reviews, only: [:show]
  resources :areas do
    resources :city
  end
  get '/assessment_forms', to: 'assessment_forms#new'
  post '/assessment_forms', to: 'assessment_forms#create'
  get '/assessment_forms/thanks', to: 'assessment_forms#thanks'
end
