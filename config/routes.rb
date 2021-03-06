# == Route Map
#
#          root        /                              authors#index
#       reviews GET    /reviews(.:format)             reviews#index
#               POST   /reviews(.:format)             reviews#create
#    new_review GET    /reviews/new(.:format)         reviews#new
#   edit_review GET    /reviews/:id/edit(.:format)    reviews#edit
#        review GET    /reviews/:id(.:format)         reviews#show
#               PUT    /reviews/:id(.:format)         reviews#update
#         books GET    /books(.:format)               books#index
#               POST   /books(.:format)               books#create
#      new_book GET    /books/new(.:format)           books#new
#     edit_book GET    /books/:id/edit(.:format)      books#edit
#          book GET    /books/:id(.:format)           books#show
#               PUT    /books/:id(.:format)           books#update
#               DELETE /books/:id(.:format)           books#destroy
# rating_author GET    /authors/:id/rating(.:format)  authors#rating
#               GET    /authors/sort/:field(.:format) authors#sort
#       authors GET    /authors(.:format)             authors#index
#               POST   /authors(.:format)             authors#create
#    new_author GET    /authors/new(.:format)         authors#new
#   edit_author GET    /authors/:id/edit(.:format)    authors#edit
#        author GET    /authors/:id(.:format)         authors#show
#               PUT    /authors/:id(.:format)         authors#update
#               DELETE /authors/:id(.:format)         authors#destroy
#

Readr::Application.routes.draw do
  root :to => 'authors#index'
  
  # resources :reviews, :only => [:index, :show]
  resources :reviews, :except => :destroy


  resources :books


  resources :authors do
    member do
      get 'rating'
    end
    
    collection do
      get 'sort/:field' => 'authors#sort'
    end
  end


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
