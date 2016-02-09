require 'rails_helper'

describe TwitterScan, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  describe ".new" do
    it "creates an object of twitter friends and suppresses SQL log output" do
      scan = TwitterScan.new
      expect(ActiveRecord::Base.logger.level).to eq(1)
      expect(scan).to be_a TwitterScan
    end
  end

end
