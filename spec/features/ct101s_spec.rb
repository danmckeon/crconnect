require 'rails_helper'

RSpec.feature "Clinical Trials 101", type: :feature, js: true do
  scenario "renders CT101 component" do
    visit "/"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content("Clinical Trials 101")
  end
  scenario "renders different answers after clicking a question" do
    visit "/"
    page.driver.browser.switch_to.alert.accept
    click_on("Are clinical trials safe?")
    expect(page).to have_content("You will be monitored very closely")
  end
end
