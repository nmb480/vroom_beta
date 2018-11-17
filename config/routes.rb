Rails.application.routes.draw do

  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :channels, only: [:show, :index, :new, :create, :update, :destroy]
  resources :channel_twitters, only: [:new, :create, :destroy]
  resources :admins, only: [:index, :create, :desroy, :edit], param: :channelId
  resources :admins do
    collection do
      get 'updateLives'
      get 'updateMovies'
      get 'updateChannels'
    end
  end
  get 'searches/channels', to: 'searches#channels'
end
