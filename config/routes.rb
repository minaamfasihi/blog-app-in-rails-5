Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  # namespace :admin do
  #   get 'dashboard/main'
  #   get 'dashboard/user'
  # end

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  # globbing - to catch everything that starts with post, and if no matching route is found, then go to the missing method in posts contoller
  get 'posts/*missing', to: 'posts#missing'

  # custom route - whatever is typed after query, is contained in :else
  get 'query/:else/:another_one', to: 'blogs#something'
  get 'query/:else', to: 'blogs#something'
  
  root to: 'pages#home'
end
