Rails.application.routes.draw do
  namespace :admins do
    get 'reservation_histories/show'
  end
  namespace :admins do
    get 'reservations/index'
    get 'reservations/show'
  end
  namespace :admins do
    get 'hotels/index'
    get 'hotels/show'
    get 'hotels/new'
    get 'hotels/edit'
  end
  namespace :admins do
    get 'festivals/index'
    get 'festivals/show'
    get 'festivals/new'
    get 'festivals/edit'
  end
  namespace :admins do
    get 'users/index'
    get 'users/show'
  end
  namespace :admins do
    get 'admins/top'
  end
  namespace :users do
    get 'reviews/new'
  end
  namespace :users do
    get 'reservation_histories/show'
  end
  namespace :users do
    get 'reservations/complete'
    get 'reservations/show'
    get 'reservations/edit'
  end
  namespace :users do
    get 'festivals/top'
    get 'festivals/about'
    get 'festivals/index'
    get 'festivals/show'
  end
  namespace :users do
    get 'users/edit'
    get 'users/show'
    get 'users/withdraw'
  end
  namespace :users do
    get 'hotels/index'
    get 'hotels/show'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
