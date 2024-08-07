Rails.application.routes.draw do
  resources :episodes
  resources :podcasts
  authenticated :user do
    root 'podcasts#index', as: "authenticated_root"
  end

  root 'welcome#index'  
  
  get   'about', to: 'static_pages#about'
  get   'contact', to: 'static_pages#contact'
  get   'privacy', to: 'static_pages#privacy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
