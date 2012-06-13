Newapp::Application.routes.draw do


   get "transactions/index"
   get "transactions/error"
   get "transactions/done"

  get "home/orgshow"
  get "home/orgdetail"
  get "myevents/adminindex"
  get "myevents/index"


  resources :invitations
  resources :contacts
  resources :organisations

 devise_for :members, :controllers => {:registrations => "registrations"}
 
  match 'home_aft_login' => 'home#aft_login'
  get "home/aft_login"
  get "home/admin_login"
 
devise_for :members
match 'home/orgdetail/:id'=>'home#orgdetail'
match 'members/edit'=>'members#edit'
match 'myevents/cause' => 'myevents#cause'
match 'myevents/event' => 'myevents#event'
match 'myevents/education' => 'myevents#education'
match 'myevents/food' => 'myevents#food'
match 'myevents/pollution' => 'myevents#pollution'
match 'myevents/environment' => 'myevents#environment'
match 'myevents/template' => 'myevents#template'
match 'myevents/message' => 'myevents#message'
match 'myevents/display_eventpg' => 'myevents#display_eventpg'
match 'invitations/event_create' => 'invitations#event_create'
match 'invitations/send_invite' => 'invitations#send_invite'
match 'invitations/event_detail' => 'invitations#event_detail'
match 'home/aboutus' => 'home#aboutus'
match 'home/works' => 'home#works'
match 'home/term' => 'home#term'
match 'transactions/new/:id' => 'transactions#new'
match 'transactions/create' => 'transactions#create'
match 'invoices/calculation'=> 'invoices#calculation'

match 'devise/home/search' => 'home#search'
match 'home/search' => 'home#search'
match 'invoices/index' => 'invoices#index'
match 'invoices/show/:id' => 'invoices#show'
match 'invoices/contribution' => 'invoices#contribution'
		
#match 'organisations/user_index' => 'organisations#user_index'
#match 'invitations/message' => 'invitations#message'
#match 'organisations'=>'organisations#new'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  
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
  # root :to => "welcome#index"
    root :to => "home#homepage"
  # root :to => "home#admin_login"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
