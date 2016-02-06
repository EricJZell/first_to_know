require 'rails_helper'

feature 'user view thier profile', %Q{
  As a signed up user
  I want to view my profile
  So that I can see my current subsciptions
} do
  let(:user) { FactoryGirl.create(:user_with_subscriptions) }
  scenario 'signed in user' do
    sign_in(user)
    expect(page).to have_content('This is your profile')
    expect(page).to have_content('Sign Out')
    expect(page.all("li.subscription").size).to eq(user.subscriptions.count)
    within("ul.subscription-list") do
      expect(page).to have_content(user.subscriptions[0].phrase)
      expect(page).to have_content(user.subscriptions[1].phrase)
      expect(page).to have_content(user.subscriptions[2].phrase)
    end
  end

  scenario 'unauthenticated user can not view profiles' do
    visit user_path(user)
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end
end
