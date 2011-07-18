class Admin::SessionsController < Admin::AdminController
  def new
  end
  
  def create
    puts ENV['TWITTER_API_CONSUMER_KEY']
    puts ENV['TWITTER_API_CONSUMER_SECRET']
    
    oauth_consumer = OAuth::Consumer.new(ENV['TWITTER_API_CONSUMER_KEY'], ENV['TWITTER_API_CONSUMER_SECRET'], :site => 'http://api.twitter.com', :request_endpoint => 'http://api.twitter.com', :sign_in => true)
    
    request_token = oauth_consumer.get_request_token(:oauth_callback => callback_admin_session_url)
    session['request_token'] = request_token.token
    session['request_secret'] = request_token.secret
    redirect_to request_token.authorize_url
  end
  
  def callback
    request_token = OAuth::RequestToken.new(oauth_consumer, session['request_token'], session['request_secret'])
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    reset_session
    # session['access_token'] = access_token.token
    # session['access_secret'] = access_token.secret
    user = client.verify_credentials
    session[:screen_name] = user.screen_name
    # redirect_back_or root_path
    
    redirect_to new_admin_session
    
  end
  
  def destroy
  end
end
