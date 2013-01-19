class TwitterNotifier < Notifier
  def send_notification
    client.update RideTweet.new(ride).to_s
  end

  private
  def client
    @client ||= Twitter::Client.new
  end
end