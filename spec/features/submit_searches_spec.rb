require 'rails_helper'

RSpec.feature "SubmitSearches", type: :feature, js: true do
  scenario "render results page on search submit" do
    visit('/')
    click_on('Find Trials')
    expect(page).to have_content('Results')
  end
end
