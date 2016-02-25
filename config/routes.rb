WednesdayWorlds::Application.routes.draw do
  namespace :admin do
    resource :dashboard, only: :show

    resource :session, :only => [:create, :new, :destroy] do
       get :callback, :on => :member
    end

    resources :rides do
      resources :events
      resources :notifiers
    end

    resources :routes

    match '/' => redirect("/admin/dashboard")
  end

  match 'login' => 'admin/sessions#new'
  match 'logout' => 'admin/sessions#destroy'

  root :to => "pages#index"
end
