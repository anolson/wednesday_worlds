WednesdayWorlds::Application.routes.draw do
  resources :rides, :only => [:show, :index] do
    get :current, :on => :collection
    resources :routes, :only => [:show, :index]
  end

  namespace :admin do
    resource :session, :only => [:create, :new, :destroy] do
       get :callback, :on => :member
    end

    resources :rides do
      resources :routes
      resources :notifiers
    end
    match '/' => redirect("/admin/rides")
  end

  match 'login' => 'admin/sessions#new'
  match 'logout' => 'admin/sessions#destroy'

  match 'guidelines' => 'pages#guidelines'
  match 'about' => 'pages#about'
  match 'contribute' => 'pages#contribute'
  root :to => "pages#index"
end
