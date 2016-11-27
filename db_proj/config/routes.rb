Rails.application.routes.draw do
 
  



  get 'welcome/index'
  post 'session/new'
  get 'add_comment' => 'recipes#add_comment'
  post 'add_comment' => 'recipes#add_comment'
  get 'possible_recipe' => 'user_accounts#possible_recipes'
  post 'possible_recipe' => 'user_accounts#possible_recipes'
  get 'destroy_comment' => 'recipes#delete_comment'
  post 'destroy_comment' => 'recipes#delete_comment'
  get '/products/recipes_products'
  get '/products/add_temp_prod'
  post '/products/add_temp_prod'
  get '/user_accounts/add_prod'
  post '/user_accounts/add_prod'
  get    'signup'  => 'user_accounts#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'search'     => 'recipes#search'
  post 'destroy_temp_prod' => 'products#destroy_temp_prod'
  post 'destroy_prod' => 'user_accounts#destroy_prod'
  post 'submit_prods' => 'products#submit_prods'
  get 'add_prods_to_recipe' => 'recipes_products#add_prods_to_recipe'
  get 'user_inventory' =>'user_accounts#inventory'
  post 'user_inventory' =>'user_accounts#inventory'
 # post '/recipes/:id', to: 'recipes#show', as: 'recipe'
 get 'recipes_view' => 'recipes#view'
 post 'recipes_view' => 'recipes#view'
  resources :recipe_prods
  resources :recipes

  resources :inventories
  resources :sessions

  resources :products

  resources :user_accounts

  resources :comment_sections

  resources :comments

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
