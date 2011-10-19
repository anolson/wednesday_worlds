require "#{Rails.root}/app/helpers/application_helper"

require 'twitter'

class TwitterRideNotifier
  include ApplicationHelper
  
  def send_notification(ride)
    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_API_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_API_CONSUMER_SECRET']
      config.oauth_token = ENV['TWITTER_API_ACCESS_TOKEN']
      config.oauth_token_secret = ENV['TWITTER_API_ACCESS_SECRET']
    end
    
    
    client = Twitter::Client.new
    client.update(ride_tweet(ride))
  end
  
  def ride_tweet(ride)
    %(#{format_date(ride.this_weeks_route.occurrence.this_weeks_date)}. #{ride.location}. #{format_time(ride.this_weeks_route.occurrence.begins_at)}. #{ride.this_weeks_route.name} #fb.) 
  end
end
