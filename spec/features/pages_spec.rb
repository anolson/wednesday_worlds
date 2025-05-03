require "rails_helper"

RSpec.feature "Pages" do
  describe "Viewing the main ride index page" do
    describe "Without a ride this week" do
      scenario "displays an appropriate message" do
        visit "/"

        expect(page).to have_text("Wednesday Worlds")
        expect(page).to have_text("No ride this week")
      end
    end

    describe "With a current ride this week" do
      let!(:this_week) { create :event, :this_week }
      let(:route) { this_week.route }

      scenario "displays info about the current ride" do
        visit "/"

        expect(page).to have_text("Wednesday Worlds")
        expect(page).to have_text("The ride this week is #{route.name}")
      end
    end


    describe "Global messaging" do
      let(:message) { "Test message" }

      describe "With global messaging configured" do
        before { stub_global_message }

        scenario "displays the message" do
          visit "/"

          expect(page).to have_text("Wednesday Worlds")
          expect(page).to have_text(message)
        end
      end

      describe "Without global messaging configured" do
        scenario "doesn't display the message" do
          visit "/"

          expect(page).to have_text("Wednesday Worlds")
          expect(page).not_to have_text(message)
        end
      end

      def stub_global_message
        allow(ENV).to receive(:[]).and_call_original
        allow(ENV).to receive(:[]).with("GLOBAL_MESSAGE").and_return(message)
      end
    end
  end
end
