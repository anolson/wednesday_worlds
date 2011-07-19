class Admin::SessionsController < Admin::AdminController
  
  skip_filter :verify_admin_authentication, :only => [:new, :create, :callback]
  
  rescue_from OAuth::Unauthorized, :with => :redirect_with_error
  
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
  end
  
  private  
    def sign_in_user(screen_name)
      reset_session
      
      # Check that screen name is in the Admin table
      # admin = Admininistrator.find_by_screen_name(screen_name)
      
      session[:screen_name] = screen_name
      redirect_to login_path
    end
  
    def redirect_with_error
      reset_session
      redirect_to login_path, :alert => "Awhoops.  Please signin again."
    end
    
    def oauth_consumer
      @oauth_consumer ||= OAuth::Consumer.new(ENV['TWITTER_API_CONSUMER_KEY'], ENV['TWITTER_API_CONSUMER_SECRET'], :site => 'http://api.twitter.com', :request_endpoint => 'http://api.twitter.com', :sign_in => true)
    end
    
    def client(access_token)
      puts "Access token: #{access_token.token}"
      puts "Access secret: #{access_token.secret}"
      
      Twitter.configure do |config|
        config.consumer_key = ENV['TWITTER_API_CONSUMER_KEY']
        config.consumer_secret = ENV['TWITTER_API_CONSUMER_SECRET']
        config.oauth_token = access_token.token
        config.oauth_token_secret = access_token.secret
      end
            
      @client ||= Twitter::Client.new
    end
end
