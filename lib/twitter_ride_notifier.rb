require 'twitter'

class TwitterRideNotifier
  def self.send(ride)
    oauth = Twitter::OAuth.new(ENV['TWITTER_API_CONSUMER_KEY'], ENV['TWITTER_API_CONSUMER_SECRET'])
    oauth.authorize_from_access(ENV['TWITTER_API_ACCESS_TOKEN'], ENV['TWITTER_API_ACCESS_SECRET'])
    
    twitter = Twitter::Base.new(oauth)
    twitter.update("#{ride.this_weeks_route.occurrence.this_weeks_date.strftime('%b %e')} #{ride.location} #{ride.this_weeks_route.occurrence.begins_at.strftime('%l:%M%p').downcase.strip} #{ride.this_weeks_route.name}")
  end
end
