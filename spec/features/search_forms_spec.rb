require 'rails_helper'

RSpec.feature "SearchForm", type: :feature, js: true do
  scenario "renders SearchForm component" do
    visit "/"
    expect(page).to have_css('form')
    expect(page).to have_content('Genetic Markers')
  end
end
