require 'rails_helper'

RSpec.feature "NavBar", type: :feature, js: true do
  scenario "the Nav Bar" do
    visit('/')
    expect(page).to have_css('nav')
    expect(page).to have_content('Search for Clinical Trials')
  end
end
