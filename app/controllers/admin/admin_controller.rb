class Admin::AdminController < ApplicationController
    
  before_filter :verify_admin_authentication
  
  def verify_admin_authentication
    unless signed_in?
      session[:return_to] = request.fullpath
      redirect_to login_path
    end
  end
  
  def signed_in?
    !session[:screen_name].nil?
  end
  helper_method "signed_in?"
end
