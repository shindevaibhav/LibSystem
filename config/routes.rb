Rails.application.routes.draw do

  get 'admins/admin_list'
  post 'bookings/search'  => 'bookings#search'
  post 'rooms/search'  => 'rooms#search'

  resources :bookings
  resources :rooms
  resources :admins
  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'helper_pages/home'
  get 'helper_pages/about'
  get 'helper_pages/contact'
  get 'sessions/new_admin'
  get 'sessions/new_member'

  root 'helper_pages#home'
  get 'about'    => 'helper_pages#about'
  get 'contact'  => 'helper_pages#contact'
  get 'signup'   => 'members#new'
  post 'signup'  => 'members#create'
  get 'new_admin_create'   => 'admins#new'
  post 'new_admin_create'  => 'admins#create'

  get  'admin_login'   => 'sessions#new_admin'
  post 'admin_login'   => 'sessions#create_admin'

  get  'member_login'  => 'sessions#new_member'
  post 'member_login'  => 'sessions#create_member'

  delete 'logout'      => 'sessions#destroy'

  get 'members/edit'
  get 'members/update'

end
