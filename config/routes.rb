WednesdayWorlds::Application.routes.draw do
  namespace :admin do
    namespace :legacy do
      resource :dashboard, only: :show

      resource :session, :only => [:create, :new, :destroy] do
         get :callback, :on => :member
      end

      resources :rides do
        resources :events
        resources :notifiers
      end

      resources :routes

      get '/' => redirect("/admin/legacy/dashboard")
    end
  end

  get 'signin' => 'admin/legacy/sessions#new'
  get 'signout' => 'admin/legacy/sessions#destroy'

  root "pages#index"
end
