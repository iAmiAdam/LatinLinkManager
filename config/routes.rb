LatinLinkManager::Application.routes.draw do
  resources :users
  resources :translators
  resources :clients
  match '/projects/closed/:id', to: 'projects#finished', via: 'put'
  match '/projects/open', to: 'projects#not_closed', via: 'get'
  match '/projects/closed', to: 'projects#closed', via: 'get'
  match '/projects/emailtranslator', to: 'projects#send_email', via: 'post'
  match '/projects/email', to: 'projects#email', via: 'post'
  resources :projects, only: [:index, :show, :new, :create, :destroy, :closed, :not_closed, :send_email]
  resources :assignments
  resources :assets
  resources :notes
  resources :orders
  resources :links
  resources :breakdowns
  resources :searches, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'static_pages#home'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/newuser', to: 'users#new', via: 'get'
  match '/editaccount', to: 'users#edit', via: 'get'
  match '/allmanagers', to: 'users#index', via: 'get'
  match '/alltranslators', to: 'translators#index', via: 'get'
  match '/newtranslator', to: 'translators#new', via: 'get'
  match '/search/:table', to: 'searches#new', via: 'get'
  match '/orders/paid/:id', to: 'orders#paid', via: 'put'
  match '/orders/paid', to: 'orders#closed', via: 'get'
  match '/orders/unpaid', to: 'orders#open', via: 'get'
  match '/orders/', to: 'order#projects_from_client', via: 'get'
  match '/translatororder', to: 'order#translator_order', via: 'put'
  match '/clientorders', to: 'orders#clients', via: 'get'
  match '/translatororders', to: 'orders#translators', via: 'get'
  match '/clients/invoice/:id/:month', to: 'clients#invoice', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
