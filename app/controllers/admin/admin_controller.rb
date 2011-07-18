class Admin::AdminController < ApplicationController
  
  # def oauth_consumer
  #   @oauth_consumer ||= OAuth::Consumer.new(ENV['TWITTER_API_CONSUMER_KEY'], ENV['TWITTER_API_CONSUMER_SECRET'], :site => 'http://api.twitter.com', :request_endpoint => 'http://api.twitter.com', :sign_in => true)
  # end
  # 
  
  def signed_in?
    !session[:screen_name].nil?
  end
  helper_method "signed_in?"
  
end
