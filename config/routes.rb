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

    get '/' => redirect("/admin/dashboard")
  end

  get 'login' => 'admin/sessions#new'
  get 'logout' => 'admin/sessions#destroy'

  root "pages#index"
end
