WednesdayWorlds::Application.routes.draw do
  resources :rides do
    get :current, :on => :collection 
    resources :routes
  end
  
  match 'guidelines' => 'pages#guidelines'
  match 'about' => 'pages#about'
  match 'contribute' => 'pages#contribute'
  root :to => "pages#index"
end
