Rails.application.routes.draw do
  
  # Devise
  devise_for :users

  # Custom routes take precendence
  get '/showings/admin', to: 'showings#indexAdmin'
  get '/films/admin', to: 'films#indexAdmin'
  get '/users/show', to: 'user#show'
  
  resources :films
  resources :showings
  resources :bookings, :only => [:index, :show, :create, :destroy]
  
  # Booking routes
  get '/showings/:id/book', to: 'showings#book'
  post '/showings/:id',     to: 'seats#getShowingSeats'
  post '/showings/:id/book',     to: 'bookings#create'

  # Redirect after sign in
  def after_sign_in_path_for(user)
    stored_location_for(user) || super
  end
  

  # Individual pages
  get 'home', to: 'home#home'
  get 'contact', to: 'home#contact'

  # Forms
  post 'request_contact', to: 'home#request_contact'

  # root
  root 'home#home'

  #if Rails.env.production?
  #get '404', :to => 'application#render_404'
  #end

end
