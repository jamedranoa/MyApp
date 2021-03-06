Rails.application.routes.draw do

  resources :users do
    member do
      get "trips"
    end
  end

  resources :reviews, only: [:create]
  resource :search, only: [:new] do
    post "perform"
    get "results"
  end

  resources :places, only: [:show, :index] do
    resources :requests, only:[:create, :new]
    resources :reviews, only:[:new]
  end

  resources :users do

    resources :places, only: [:create, :new, :destroy, :edit, :update] do
      member do
        post "block"
      end
    end

    resources :reviews, only:[:new]

    resources :requests, only:[:index]

  end


    resources :requests,only:[] do
      member do
        put "approve"
        put "deny"
      end
    end


  resource :session, :only => [ :create, :destroy, :new ]
  root to: "places#index"

  namespace :api, defaults:{ format: :json } do
    resources :users, only:[ :show, :edit, :index, :update ]
    resources :places, only:[ :show, :edit, :index, :update ]
  end

  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'

  # resource :places, only:[] do
#     member do
#       post "new_pic"
#     end
#   end

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
