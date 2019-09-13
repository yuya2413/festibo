Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users/festivals#top'
  get 'about', to: 'users/festivals#about'

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
    get 'reservation_histories/show'
    get 'reservations/index'
    get 'reservations/show'
    get 'hotels/index'
    get 'hotels/show'
    get 'hotels/new'
    get 'hotels/edit'
    get 'festivals/index'
    get 'festivals/show'
    get 'festivals/new'
    get 'festivals/edit'
    get 'users/index'
    get 'users/show'
    get 'admins/top'
  end
  devise_for :admins
  devise_for :users
end
