require 'rails_helper'

RSpec.feature "Home Page Static Content", type: :feature, js: true do
  scenario "renders static content on home page" do
    visit "/"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Clinical trials have a participant satisfaction\
     rate of more than 90%, yet less than 5% of cancer patients participate."
    expect(page).to have_css('nav')
    expect(page).to have_content('Search for Clinical Trials')
    expect(page).to have_css('form')
    expect(page).to have_content('Have you received chemotherapy as a treatment?')
  end
end
