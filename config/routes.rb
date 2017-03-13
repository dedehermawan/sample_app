Rails.application.routes.draw do
  get 'users/new'

  root 'home#index'
  get  '/help',    to: 'home#help'
  get  '/about',   to: 'home#about'
  get  '/contact', to: 'home#contact'
  get  '/signup',  to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
