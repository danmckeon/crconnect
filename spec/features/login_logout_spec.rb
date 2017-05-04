require 'rails_helper'

RSpec.feature "LoginLogout", type: :feature, js: true do
  let!(:user) { FactoryGirl.create(:user) }
  scenario "logging in and out" do
      visit "/admin"
      fill_in('session_email', with: 'beans@beans.com')
      fill_in('session_password', with: 'beans')
      click_on('Log In')
      expect(page).to have_content("Pending Trials")
      click_on('Logout')
      expect(page).to have_content("CRC Admin Portal")
  end
  scenario "unsuccessful login" do
    visit "/admin"
    fill_in('session_email', with: "pop@pop.com")
    fill_in('session_password', with: "123")
    click_on('Log In')
    expect(page).to have_content("CRC Admin Portal")
  end
end
