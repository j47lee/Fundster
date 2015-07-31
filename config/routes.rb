Rails.application.routes.draw do

  root "sessions#new"
  get '/logout' => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :items

#JIMMY DELETE USERS ITEMS
  delete "/users/:id/items/:item_id" => "users#remove_item", as: :remove_item

#FUND USER ITEM
  patch "/users/:id/items/:item_id" => "users#fund_item", as: :fund_item

#PERCENTAGE COMPLETE
  # get "/users/:id/items/:item_id" => "users#percentage_complete", as: :percentage_complete

#TONY ADD ITEMS TO USER
  get 'add_item_to_user' => 'items#add_item_to_user', as: :add_item_to_user


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
