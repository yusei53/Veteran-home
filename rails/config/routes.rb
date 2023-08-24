# frozen_string_literal: true

Rails.application.routes.draw do
  resources :areas, :stores, :reviews, only: [:show]
  get '/assessment_forms', to: 'assessment_forms#index'
  get '/assessment_forms/thanks', to: 'assessment_forms#thanks'
end
