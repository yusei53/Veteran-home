# frozen_string_literal: true

Rails.application.routes.draw do
  resources :areas, :stores, :reviews, only: [:show]
end
