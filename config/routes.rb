Rails.application.routes.draw do
  
  # static pages
  get 'home', to: 'home#home'
  get 'contact', to: 'home#contact'

  # forms

  #resources

  root 'home#home'
  
  # 404
  get '*unmatched_route', to: 'application#render_404'

end
