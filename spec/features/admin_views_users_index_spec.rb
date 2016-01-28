require 'rails_helper'

feature 'admin views user index', %Q{
  As an admin
  I want to view a list of users
  So that I can monitor who is using the site
} do
  let!(:user_1) { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }

  scenario 'admin views user list' do
    sign_in(admin)
    visit users_path
    expect(page).to have_content(user_1.email)
    expect(page).to have_content(user_2.email)
  end

  scenario 'non-admin can not view index' do
    sign_in(user_1)
    visit users_path
    expect(page).to have_content("You do not have permission to view this page")
  end
end
