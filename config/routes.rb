Rails.application.routes.draw do
  
  # static pages
  get 'home', to: 'home#home'
  get 'contact', to: 'home#contact'

  # forms
  post 'request_contact', to: 'home#request_contact'

  #resources

  root 'home#home'
  
  # 404
  get '*unmatched_route', to: 'application#render_404'

end
