Rails.application.routes.draw do
  # Devise
  devise_for :users


  #resources
  resources :films
  resources :showings
  resource :booking
  
  get '/showings/:id/book', to: 'showings#book'

  def after_sign_in_path_for(user)
    stored_location_for(user) || super
  end
  

  # stand-alone pages
  get 'home', to: 'home#home'
  get 'contact', to: 'home#contact'

  # forms
  post 'request_contact', to: 'home#request_contact'



  # root
  root 'home#home'

end
