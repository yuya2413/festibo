Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_for :admins
  root to: 'users/festivals#top'
  get 'about', to: 'users/festivals#about'

  namespace :users do
    devise_scope :user do
      get '/logout', to: 'sessions#destroy', as: 'logout'
    end
  end

  namespace :users do
  	resources :users, only:[:edit, :update, :show] do
  		get 'withdraw', to: 'users#withdraw', as: 'withdraw'
        patch 'withdraw', to: 'users#quit', as: 'quit'
  		resources :reservations, except:[:new, :index]
  	    get 'reservations/:id/thanks', to: 'reservations#complete', as: 'reservation_complete'
    end
    resources :festivals, only:[:index, :show]
    resource :favorites, only:[:create, :destroy]
    resources :hotels, only:[:index, :show]
    resources :reservation_histories, only:[:show]
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
