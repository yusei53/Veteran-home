Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => "/ops"

  resources :areas, :stores, :reviews

end
