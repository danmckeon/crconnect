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
  scenario "renders different answers after clicking a question consecutively" do
    visit "/"
    page.driver.browser.switch_to.alert.accept
    click_on("Are clinical trials safe?")
    expect(page).to have_content("You will be monitored very closely")
    click_on("What is informed consent?")
    expect(page).to have_content("In addition, it is your right to withdraw at any point, even after granting consent.")
    click_on("Why participate in a clinical trial?")
    expect(page).to have_content("You may receive access to cutting edge")
    click_on("How do I participate in a clinical trial?")
    expect(page).to have_content("consult your doctor to see if it is a good fit for you")
  end
end
