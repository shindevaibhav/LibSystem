Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  resources :admins
  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'helper_pages/home'
  get 'helper_pages/about'
  get 'helper_pages/contact'

  root 'helper_pages#home'
  get 'about'  => 'helper_pages#about'
  get 'contact'  => 'helper_pages#contact'
  get 'signup' => 'members#new'

end
