class Notifier < ActiveRecord::Base
  belongs_to :ride

  def send_notification
    raise NotImpementedError.new
  end
end
