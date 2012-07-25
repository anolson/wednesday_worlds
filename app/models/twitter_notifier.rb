class TwitterNotifier < Notifier
  def send_notification
    client.update ride_tweet
  end

  private

  #FIXME Move into initializer.
  def client
    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_API_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_API_CONSUMER_SECRET']
      config.oauth_token = ENV['TWITTER_API_ACCESS_TOKEN']
      config.oauth_token_secret = ENV['TWITTER_API_ACCESS_SECRET']
    end
    @client ||= Twitter::Client.new
  end

  # FIXME Refactor this.
  def ride_tweet
    %(#{date}. #{location}. #{time}. #{name} #fb.) 
  end

  def date
    format_date(ride.routes.this_week.occurrence.next_date)
  end

  def location
    ride.location
  end

  def time
    format_time(ride.routes.this_week.occurrence.begins_at)
  end

  def name
    ride.routes.this_week.name
  end
end