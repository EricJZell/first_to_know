require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  # Acceptance Criteria:
  # * I must specify a valid email address, authorization token, phone number
  #   password, and password confirmation
  # * If I don't specify the required information, I am presented with
  #   an error message
  let(:valid_token) { AuthorizationToken.create(token: SecureRandom.uuid) }

  scenario 'provide valid registration information' do
    visit new_user_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Authorization token', with: valid_token.token
    fill_in 'Phone number', with: '15555555'
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide valid token with invalid registration information' do
    visit new_user_registration_path
    fill_in 'Authorization token', with: valid_token.token
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'provide valid registration information with invalid authorization token' do
    visit new_user_registration_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Authorization token', with: SecureRandom.uuid
    click_button 'Sign up'
    expect(page).to have_content("Invalid Authorization Token")
    expect(page).to_not have_content('Sign Out')
  end
end
