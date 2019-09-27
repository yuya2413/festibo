Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
  sessions:      'users/sessions'}

  devise_for :admins
  root to: 'users/festivals#top'
  get 'about', to: 'users/festivals#about'

  namespace :users do
    devise_scope :user do
      get '/logout', to: 'sessions#destroy', as: 'logout'
    end
  end

  namespace :users do
    #get 'withdraw', to: 'users#withdraw', as: 'user/withdraw'
    patch 'users/:id', to: 'users#quit', as: 'user/quit'
  	resources :users, only:[:edit, :update, :show] do
  	  resources :reservations, except:[:index]
  	    get 'reservations/:id/thanks', to: 'reservations#complete', as: 'reservation_complete'
        resources :reservation_histories, only:[:show]
    end
    resources :festivals, only:[:index, :show]
    get 'festivals/:id/hotels', to: "hotels#index", as: "hotels"
    get 'festivals/:id/hotels/:id', to: "hotels#show", as: "hotel"
    resource :favorites, only:[:create, :destroy]

    resources :reviews, only:[:new, :create, :destroy]
  end

  namespace :admins do
  	get '', to: 'admins#top', as: 'admins'
  	resources :users, only:[:index, :show]
  	patch 'users/:id', to: 'users#quit', as: 'user_quit'
    resources :festivals
    resources :reviews, only:[:destroy]
    resources :hotels
    resources :reservations, only:[:index, :show]
    resources :reservation_histories, only:[:show]
  end
end
