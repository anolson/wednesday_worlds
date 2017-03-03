class Admin::SessionsController < Admin::AdminController
  skip_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
    if user = User.authenticate(params[:session][:email], params[:session][:password])
      sign_in(user)
    else
      flash.now.alert = "Email + password don't match :("
      render "new", status: :unauthorized
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end

  private

  def sign_in(user)
    reset_session
    self.current_user = user.id
    redirect_to_intended_path
  end

  def sign_out
    reset_session
    self.current_user = nil
  end
end
