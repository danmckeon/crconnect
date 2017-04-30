require 'rails_helper'

RSpec.feature "SubmitSearches", type: :feature, js: true do
  scenario "render results page on search submit" do
    visit('/')
    select('Lung Cancer', from: 'cancerType')
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '25')
    click_on('Find Trials')
    expect(page).to have_content('Showing clinical trials for')
  end
end
