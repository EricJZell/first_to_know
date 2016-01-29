require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  describe "#downcase_phrase" do
    it "makes the phrase attribute all lowercase" do
      sub = Subscription.new(user: user, twitter_handle: "hula_zell", phrase: "YOLO")
      sub.downcase_phrase
      expect(sub.phrase).to eq("yolo")
    end
  end
end
