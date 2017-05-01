require 'rails_helper'

RSpec.feature "Mission", type: :feature, js: true do
  scenario "renders Mission component" do
    visit "/"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Less than 5% of cancer patients participate in clinical trials despite having a participant satisfaction rate of more than 90%."
  end
end
