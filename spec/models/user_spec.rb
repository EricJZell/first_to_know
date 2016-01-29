require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#admin?" do
      it "returns true when user is admin" do
        user = FactoryGirl.create(:admin)
        expect(user.admin?).to be true
      end
      it "returns false when user is not an admin" do
        user = FactoryGirl.create(:user)
        expect(user.admin?).to be false
      end
  end
end
