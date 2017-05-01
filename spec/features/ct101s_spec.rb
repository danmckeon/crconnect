require 'rails_helper'

RSpec.feature "Clinical Trials 101", type: :feature, js: true do
  scenario "renders CT101 component" do
    visit "/"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content("Clinical Trials 101")
  end
end
