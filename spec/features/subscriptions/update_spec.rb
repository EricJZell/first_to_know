require 'rails_helper'

feature 'update a subscription', %Q{
  As a user
  I want to update a subscription
  If I change my mind on what alerts I want
} do

  let(:user) { FactoryGirl.create(:user_with_subscriptions) }
  let(:sub) { user.subscriptions.first }

  scenario 'user enters valid subscription attributes' do
    sign_in(user)
    within dom_id_for(sub) do
      click_link "Edit"
    end
    fill_in "Twitter handle", with: "hula_zell"
    fill_in "Phrase", with: "Hello World"
    click_button "Update Subscription"
    expect(page).to have_content("Subscription updated successfully")
  end

  scenario 'user leaves fields blank' do
    sign_in(user)
    within dom_id_for(sub) do
      click_link "Edit"
    end
    fill_in "Twitter handle", with: ""
    fill_in "Phrase", with: ""
    click_button "Update Subscription"
    expect(page).to have_content("Twitter handle can't be blank")
    expect(page).to have_content("Phrase can't be blank")
  end
end
