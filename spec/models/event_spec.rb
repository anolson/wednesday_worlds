require 'rails_helper'

RSpec.describe Event do
  describe "#this_week?" do
    context "with a ride this week" do
      subject { build_stubbed :event, :this_week }

      it "returns true" do
        expect(subject.this_week?).to be_truthy
      end
    end

    context "with a ride next week" do
      subject { build_stubbed :event, :next_week }

      it "returns true" do
        expect(subject.this_week?).to be_falsey
      end
    end
  end

  describe "#next_week?" do
    context "with a ride next week" do
      subject { build_stubbed :event, :next_week }

      it "returns true" do
        expect(subject.next_week?).to be_truthy
      end
    end

    context "with a ride this week" do
      subject { build_stubbed :event, :this_week }

      it "returns true" do
        expect(subject.next_week?).to be_falsey
      end
    end
  end
end
