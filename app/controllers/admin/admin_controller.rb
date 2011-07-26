class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :verify_admin_authentication
    
  private  
    def verify_admin_authentication
      unless signed_in?
        session[:return_to] = request.fullpath
        redirect_to login_path
      end
    end
    
    def signed_in?
      current_admin != nil
    end
    helper_method "signed_in?"
    
    def current_admin
      @current_admin ||= Administrator.find_by_twitter_screen_name(session[:screen_name])
    end

    def redirect_to_intended_path
      session[:return_to] ? redirect_to(session[:return_to]) : redirect_to(admin_rides_path)
      session[:return_to] = nil
    end  
end
