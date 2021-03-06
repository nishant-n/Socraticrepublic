Socraticrepublic::Application.routes.draw do
  


  resources :discussions do
    member do
         get 'add_my_topic'
         get 'view_discussion'
         get 'comments'
         get 'show_user'
         get 'view_user_comments'
         get 'show_user_discussion'
         delete 'destroy_user_discussion'
         get 'representive_list' 
         get 'show_city'
        
    end
    collection do
      get 'add_discussion'
    end 
    resources :votes do
      collection do
      post 'get_votes'
      post 'post_user_vote'
    end
  end

 
  resources :declarations do
    collection do
      post 'create_declaration'
    end
  end    
end  


  resources :user_profiles


  #devise_for :users
  devise_for :users, :controllers => {:sessions => "sessions"}
 
  resources :users  do
    collection do
         post 'create_user'
      end
  end

  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end
   
  #devise_for :user,:controllers => {:sessions => "sessions"}, :path => '', :path_names => { :sign_in => "login", :sign_out => "destroy", :sign_up => "register" }
  
   resources :comments
   resources :discussions do
    member do
       

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
  root :to => 'users#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
