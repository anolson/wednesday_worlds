Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_API_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_API_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_API_ACCESS_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_API_ACCESS_SECRET']
end
