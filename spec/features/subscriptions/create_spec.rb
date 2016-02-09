require 'rails_helper'

feature 'create new subscription', %Q{
  As a user
  I want to create a new subscription
  So that I can be the first to know about other things
} do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user enters valid subscription attributes' do
    sign_in(user)
    click_link "New Subscription"
    fill_in "Twitter handle", with: "ez_codes"
    fill_in "Phrase", with: "Hello World"
    VCR.use_cassette("create_subscription") do
      click_button "Create Subscription"
    end
    expect(page).to have_content("New subscription added")
  end

  scenario 'user leaves fields blank' do
    sign_in(user)
    click_link "New Subscription"
    fill_in "Twitter handle", with: ""
    fill_in "Phrase", with: ""
    click_button "Create Subscription"
    expect(page).to have_content("Twitter handle can't be blank")
    expect(page).to have_content("Phrase can't be blank")
  end
end
