# frozen_string_literal: true

Rails.application.routes.draw do
  resources :areas, :stores, :reviews, only: [:show]
  get '/assessment_form', to: 'assessment_forms#new'
  get '/assessment_forms/thanks', to: 'assessment_forms#thanks'
end
