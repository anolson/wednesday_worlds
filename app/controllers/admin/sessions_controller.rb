class Admin::SessionsController < Admin::AdminController
  skip_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
    if user = User.authenticate(params[:session][:email], params[:session][:password])
      signin(user)
    else
      render 'new', alert: "Email + password don't match"
    end
  end

  def destroy
    signout
    redirect_to signin_path
  end

  private

  def signin(user)
    reset_session
    self.current_user = user.id
    redirect_to_intended_path
  end

  def signout
    reset_session
    self.current_user = nil
  end
end
