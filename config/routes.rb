Movingboxsearch::Application.routes.draw do

  get "sitemap/index"

  match "kits/:slug" => "kits#index"

  resources :companies

  resources :moving_box_kits

  get "content/about_us"

  get "content/contact_us"

  resources :purchases

  match 'admin' => 'admin#index'

  # match ':controller(/:action(/:id(.:format)))'
  match "sitemap(.:format)" => "sitemap#index"

  get "admin/view_users"
  get "admin/login_as"
  get "admin/login_as_admin"


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }

#  get "accounts/show"
  match "accounts/show/:id" => "accounts#show"

  resources :box_choices

  resources :move_sizes

  resources :used_card_board_box_products

  #match "searches/track_click/:user_id/:search_id/:link" => "searches#track_click"
  get "searches/track_click"
  resources :searches


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "searches#new"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
