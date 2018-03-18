require 'sidekiq/web'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'search', to: 'search#index'
  get 'search/:keywords', to: 'search#index'
  resources :collections do
    post :add_torrent_to_collection, on: :collection, as: :add_torrent
    resources :torrents, controller: :collections_torrents
  end
  post 'collections/add_torrents_to_collection',
       to: 'collections_torrents#add_torrents_to_collection',
       as: :add_torrent_to_collection

  resources :downloads, only: [:index]
  mount Sidekiq::Web => '/sidekiq'
end
