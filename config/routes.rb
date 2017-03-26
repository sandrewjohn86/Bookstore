Rails.application.routes.draw do

  resources :books, :categories

  namespace :admin do
    resources :books, :categories, :authors, :publishers, :users, :sessions
  end
  
  namespace :admin do
  get 'login' => 'sessions#new', :as => 'login'
  end

  namespace :admin do
  get 'logout' => 'sessions#destroy', :as => 'logout'
  end

  namespace :admin do
  get 'sessions/create'
  end

  namespace :admin do
  get 'users/new'
  end

  namespace :admin do
  get 'users/create'
  end

  namespace :admin do
  get 'users/edit'
  end

  namespace :admin do
  get 'users/update'
  end

  namespace :admin do
  get 'users/destroy'
  end

  namespace :admin do
  get 'users/index'
  end

  namespace :admin do
  get 'users/show'
  end

  namespace :admin do
  get 'publishers/new'
  end

  namespace :admin do
  get 'publishers/edit'
  end

  namespace :admin do
  get 'publishers/index'
  end

  namespace :admin do
  get 'categories/new'
  end

  namespace :admin do
  get 'categories/edit'
  end

  namespace :admin do
  get 'categories/index'
  end

  namespace :admin do
  get 'categories/show'
  end

  namespace :admin do
  get 'books/new'
  end

  namespace :admin do
  get 'books/edit'
  end

  namespace :admin do
  get 'books/index'
  end

  namespace :admin do
  get 'authors/new'
  end

  namespace :admin do
  get 'authors/edit'
  end

  namespace :admin do
  get 'authors/index'
  end

  get 'categories/index'

  get 'categories/show'

  get 'books/index'

  get 'books/show'

  get 'about' => 'about#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'books#index'

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
