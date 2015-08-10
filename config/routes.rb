Rails.application.routes.draw do

  wash_out :webservice


  resources :tasks
  resources :relatos
  resources :conditionals
  resources :projetos
  resources :locals
  resources :clientes
  resources :reltasks
  resources :users, only: [:new, :create, :update, :destroy] do
    member do
      get :activate
    end
  end


  resources :reset_passwords, only: [:new, :create, :update, :edit]

  resources :sessions, only: [:new, :create, :destroy]

  get '/consultor', to: 'users#new', as: :sign_up
get '/cliente', to: 'clientes#new', as: :clienta
get '/projetos/new', to: 'projetos#new', as: :projetopo
get '/atividades', to: 'tasks#new', as: :taski
get '/relatorio', to: 'relatos#new', as: :relatoss
get '/condicional', to: 'conditionals#new', as: :condit
get '/local', to: 'locals#new', as: :loca

  get '/log_in', to: 'sessions#new', as: :log_in
  get '/log_out', to: 'sessions#destroy', as: :log_out
      


  root to: 'sessions#new'

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
