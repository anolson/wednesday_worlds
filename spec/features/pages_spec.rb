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

      scenario "displays an appropriate message" do
        visit "/"

        expect(page).to have_text("Wednesday Worlds")
        expect(page).to have_text("The ride this week is #{route.name}")
      end
    end
  end
end
