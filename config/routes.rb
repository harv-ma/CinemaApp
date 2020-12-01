Rails.application.routes.draw do
  # Devise
  devise_for :users


  #resources
  resources :films
  resources :showings

  # customers



  # bookings


  # stand-alone pages
  get 'home', to: 'home#home'
  get 'contact', to: 'home#contact'

  # forms
  post 'request_contact', to: 'home#request_contact'



  # root
  root 'home#home'

end
