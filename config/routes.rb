WednesdayWorlds::Application.routes.draw do
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

  root :to => "pages#index"
end
