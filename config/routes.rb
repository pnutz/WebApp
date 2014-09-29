WebApp::Application.routes.draw do

  resources :documents

  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks", :registrations => "users/registrations"}
  resources :folder_types

  resources :purchase_types

  resources :receipt_items

  namespace :api do
    namespace :v1  do
#          resources :tokens,:only => [:create, :destroy]
          match "tokens" => 'tokens#create', :via => :post
          match "tokens" => 'tokens#destroy', :via => :delete
    end
  end

  resources :receipts
  resources :currencies
  resources :purchase_types
  resources :user_settings

  resources :folders do
		resources :receipts
	end

  resources :addresses

  get "users/index"
  get "home/index"
  # link to omniauth
  #get '/auth/:provider/callback', :to => 'sessions#create'
  #get '/auth/failure', :to => 'sessions#failure'
  # Gets the tags for either a receipt, receipt_item or user
  get "tags/:type/:id", :to => 'tags#index'
  post "tags/:type/:id", :to => 'tags#create'


  # makes our default page the 'index' endpoint in the HomeController
  root to: 'home#index'
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
