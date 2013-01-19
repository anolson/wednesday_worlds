class Admin::SessionsController < Admin::AdminController
  skip_filter :verify_admin_authentication, :only => [:new, :create, :callback]

  rescue_from OAuth::Unauthorized, :with => :force_sign_in

  def new; end

  def create
    request_token = oauth_consumer.get_request_token(:oauth_callback => callback_admin_session_url)
    session['request_token'] = request_token.token
    session['request_secret'] = request_token.secret
    redirect_to request_token.authorize_url
  end

  def callback
    request_token = OAuth::RequestToken.new(oauth_consumer, session['request_token'], session['request_secret'])
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])

    user = client(access_token).verify_credentials
    sign_in_user(user.screen_name)
  end

  def destroy
    reset_session
    @current_admin = nil
    redirect_to login_path
  end

  private
  def sign_in_user(screen_name = "")
    reset_session
    admin = Administrator.find_by_twitter_screen_name(screen_name)

    if(admin)
      session[:screen_name] = admin.twitter_screen_name
      redirect_to_intended_path
    else
      redirect_with_alert("Looks like you don't have admin access.  E-mail hello@wednesdayworlds.com to get access.")
    end
  end

  def force_sign_in(exception)
    redirect_with_alert "Awhoops.  Please signin again."
  end

  def redirect_with_alert(alert)
    reset_session
    redirect_to login_path, :alert => alert
  end

  def oauth_consumer
    @oauth_consumer ||= OAuth::Consumer.new(ENV['TWITTER_API_CONSUMER_KEY'], ENV['TWITTER_API_CONSUMER_SECRET'], :site => 'http://api.twitter.com', :authorize_path => '/oauth/authenticate')
  end

  def client(access_token)
    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_API_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_API_CONSUMER_SECRET']
      config.oauth_token = access_token.token
      config.oauth_token_secret = access_token.secret
    end
    @client ||= Twitter::Client.new
  end
end
