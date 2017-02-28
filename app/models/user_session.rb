class UserSession
  attr_reader :session

  def initialize(session)
    @session = session
  end

  def current_user=(user_id)
    session[:current_user] = user_id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user])
  end
end
