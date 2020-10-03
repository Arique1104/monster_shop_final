Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :root, to: 'welcome#index'

  resources :merchants do
    resources :items, only: [:index]
  end

  resources :items, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]


 resource :cart, only: [:show], controller: 'cart' do
    post ':item_id', :action => 'add_item'
    delete '', :action => 'empty'
    patch ':change/:item_id', :action => 'update_quantity'
    delete ':item_id', :action => 'remove_item'
  end

  resources :users, only: [:create, :update]

  scope controller: 'users' do
    get '/registration', :action => 'new', as: :registration
    patch '/user/:id', :action => 'update'
    get '/profile', :action => 'show'
    get '/profile/edit', :action => 'edit'
    get '/profile/edit_password', :action => 'edit_password'
  end

  scope controller: 'orders', module: 'user' do
    post '/orders', :action => 'create'
    get '/profile/orders', :action => 'index'
    get '/profile/orders/:id', :action => 'show'
    delete '/profile/orders/:id', :action => 'cancel'
  end

  scope controller: 'sessions' do
    get '/login', :action => 'new'
    post '/login', :action => 'login'
    get '/logout', :action => 'logout'
  end

  namespace :merchant do
    scope 'bulk_discounts', controller: 'bulk_discount' do
      get ':id/edit', :action => 'edit'
      patch ':id/update', :action => 'update'
      delete ':id', :action => 'destroy'
      post 'create', :action => 'create'
      get 'new', :action => 'new'
      get ':id', :action => 'show'
      get '', :action => 'index'
      patch ':id', :action => 'update_status'
    end

    get '/', to: 'dashboard#index', as: :dashboard
    resources :orders, only: :show
    resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
    put '/items/:id/change_status', to: 'items#change_status'
    get '/orders/:id/fulfill/:order_item_id', to: 'orders#fulfill'
  end

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :merchants, only: [:show, :update]
    resources :users, only: [:index, :show]
    patch '/orders/:id/ship', to: 'orders#ship'
  end
end
