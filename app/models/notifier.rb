class Notifier < ActiveRecord::Base
  AVAILABLE_TYPES = [["Email", "EmailNotifier"], ["Twitter", "TwitterNotifier"]]

  belongs_to :ride

  validates_presence_of :recipient

  def send_notification
    raise NotImpementedError.new
  end

  def humanize_type
    type.underscore.humanize
  end
end
