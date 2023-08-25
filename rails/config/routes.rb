# frozen_string_literal: true

Rails.application.routes.draw do
  resources :areas, :stores, :reviews, only: [:show]
  get '/assessment_forms', to: 'assessment_forms#index'
  post '/assessment_forms', to: 'assessment_forms#create'
  get '/assessment_forms/thanks', to: 'assessment_forms#thanks'
end
