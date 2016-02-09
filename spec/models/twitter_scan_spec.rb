require 'rails_helper'

describe TwitterScan, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    allow(CLIENT).to receive(:messages) { "text sent" }
  end

  describe ".new" do
    it "creates an object of twitter friends and suppresses SQL log output" do
      VCR.use_cassette("twitter_scan_new") do
        scan = TwitterScan.new
        expect(ActiveRecord::Base.logger.level).to eq(1)
        expect(scan).to be_a TwitterScan
      end
    end
  end

  describe "#call" do
    it "returns a Twitter::Cursor" do
      VCR.use_cassette("twitter_scan_call") do
        expect(TwitterScan.new.call).to be_a(Twitter::Cursor)
      end
    end
  end

end
