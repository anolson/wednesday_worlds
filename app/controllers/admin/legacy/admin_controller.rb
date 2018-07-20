class Admin::Legacy::AdminController < ApplicationController
  layout 'admin'
  before_action :require_user

  delegate :current_user, :current_user=, to: :user_session
  helper_method :current_user, :signed_in?

  private

  def require_user
    unless signed_in?
      session[:return_to] = request.fullpath
      redirect_to signin_path
    end
  end

  def signed_in?
    user_session.current_user != nil
  end

  def redirect_to_intended_path
    session[:return_to] ? redirect_to(session[:return_to]) : redirect_to(admin_legacy_dashboard_path)
    session[:return_to] = nil
  end

  def user_session
    @user_session ||= UserSession.new(session)
  end
end
