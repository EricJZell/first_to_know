require 'rails_helper'

feature 'delete subscription', %Q{
  As a user
  I want to delete a subscription
  If I don't want those alerts anymore
} do

  scenario "user clicks delete on a subscription" do
    user = FactoryGirl.create(:user_with_subscriptions)
    initial_count = user.subscriptions.count
    sub = user.subscriptions.first
    sign_in(user)
    within(dom_id_for(sub)) do
      click_link "Delete"
    end
    expect(page).to have_content("Subscription deleted")
    user.reload
    expect(user.subscriptions.count).to eq(initial_count - 1)
  end


end
