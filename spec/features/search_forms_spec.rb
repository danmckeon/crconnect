require 'rails_helper'

RSpec.feature "SearchForm", type: :feature, js: true do
  scenario "renders SearchForm component" do
    visit "/"
    expect(page).to have_css('form')
    expect(page).to have_content('Is chemotherapy your main form of treatment?')
  end
end
