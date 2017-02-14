require "rails_helper"

RSpec.describe EventMailer do
  describe "notify" do
    let(:event) { create :event, :this_week }
    let(:formatted_date) { event.begins_at.strftime("%b %e") }
    let(:recipient) { "wednesdayworlds@googlegroups.com" }

    subject(:mail) { EventMailer.event_notification(recipient, event) }

    it "renders the headers" do
      expect(mail.subject).to eq("WednesdayWorlds - #{formatted_date}")
      expect(mail.to).to eq([recipient])
      expect(mail.from).to eq(["hello@wednesdayworlds.org"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("The ride this week is #{event.route.name}")
    end
  end
end
