class TwitterNotifier < Notifier
  def send_notification(event)
    return unless enabled?

    client.update RideTweet.new(event).to_s
  end

  private

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter.api_consumer_key
      config.consumer_secret = Rails.application.credentials.twitter.api_consumer_secret
      config.access_token = Rails.application.credentials.twitter.api_access_token
      config.access_token_secret = Rails.application.credentials.twitter.api_access_secret
    end
  end
end
