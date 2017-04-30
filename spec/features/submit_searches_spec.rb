require 'rails_helper'

RSpec.feature "SubmitSearches", type: :feature, js: true do
  scenario "render results page on search submit" do
    visit('/')
    click_on('Find Trials')
    expect(page).to have_content('Showing clinical trials for')
  end

scenario "render some results when given good input" do
  visit('/')
  select('Lung Cancer', from: 'cancerType')
  select('Non-Small Cell Lung Cancer (Large Cell)', from: 'cancerSubType')
  select('Stage IV', from: 'cancerStage')
  select('Yes', from: 'chemotherapy')
  select('Yes', from: 'radiation')
  fill_in('age', with: '16')
  click_on('Find Trials')
  expect(page).to have_content('Showing clinical trials for')
end

before(:each){ FactoryGirl.create(:happy_submit) }
scenario "render the correct results when given good input" do
  visit('/')
  select('Lung Cancer', from: 'cancerType')
  select('Non-Small Cell Lung Cancer (Adenocarcinoma)', from: 'cancerSubType')
  select('Stage I', from: 'cancerStage')
  select('No', from: 'chemotherapy')
  select('No', from: 'radiation')
  fill_in('age', with: '50')
  click_on('Find Trials')
  expect(page).to have_content("Randomized Phase II")
end
end
