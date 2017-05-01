require 'rails_helper'

RSpec.feature "NavBar", type: :feature, js: true do
  scenario "the Nav Bar" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_css('nav')
    expect(page).to have_content('Search for Clinical Trials')
  end
end
