require 'twitter'

class TwitterRideNotifier
  include ApplicationHelper
  
  attr_accessor :oauth
  
  def initialize
    @oauth = Twitter::OAuth.new(ENV['TWITTER_API_CONSUMER_KEY'], ENV['TWITTER_API_CONSUMER_SECRET'])
    @oauth.authorize_from_access(ENV['TWITTER_API_ACCESS_TOKEN'], ENV['TWITTER_API_ACCESS_SECRET'])
  end
  
  def send_notification(ride)
    twitter = Twitter::Base.new(@oauth)
    twitter.update(ride_tweet(ride))
  end
  
  def ride_tweet(ride)
    %(#{format_date(ride.this_weeks_route.occurrence.this_weeks_date)}. #{ride.location}. #{format_time(ride.this_weeks_route.occurrence.begins_at)}. #{ride.this_weeks_route.name}.) 
  end
end
