ServiceBazaar::Application.routes.draw do
  get "sessions/new"
  get "pages/contact"
  get "pages/home"
  post "pages/home"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :services

  match "/services/new", to: "services#new", via: [:post, :get]

  match '/signin', :to => 'sessions#new', :via => 'get'
  match '/signout', :to => 'sessions#destroy', :via => 'delete'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home', via: [:get,:post]
  match "/home", to: "pages#home", via: [:get, :post]
  match "/contact", to: "pages#contact", via: [:get]
  match "/usersignup", to: "users#create", via: [:post]
  match "/forgot_password", to: "pages#forgot_password", via: [:get]
  match "/forgotPassword", to: "users#forgot_password", via: [:post]
  match "/messages", to: "users#messages_show", via: [:get]
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
