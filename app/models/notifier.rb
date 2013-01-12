class Notifier < ActiveRecord::Base
  belongs_to :ride

  def send_notification
    raise NotImpementedError.new
  end

  def humanize_type
    type.underscore.humanize
  end
end
