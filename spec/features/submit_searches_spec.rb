require 'rails_helper'

RSpec.feature "SubmitSearches", type: :feature, js: true do
  before(:each) do
    FactoryGirl.create(:happy_submit)
    FactoryGirl.create(:grumpy_submit)
  end

  scenario "render results page on search submit" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '25')
    click_on('Find Trials')
    expect(page).to have_content('Showing clinical trials for')
  end

  scenario "render some results when given good input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Non-Small Cell Lung Cancer (Large Cell)', from: 'cancerSubType')
    select('Stage IV', from: 'cancerStage')
    select('Yes', from: 'chemotherapy')
    select('Yes', from: 'radiation')
    fill_in('age', with: '16')
    click_on('Find Trials')
    expect(page).to have_content('Showing clinical trials for')
  end

  scenario "render the correct results when given good input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Non-Small Cell Lung Cancer (Adenocarcinoma)', from: 'cancerSubType')
    select('Stage I', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '50')
    click_on('Find Trials')
    expect(page).to have_content("Randomized Phase II")
  end

  scenario "render the correct results when given good input part 2" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Non-Small Cell Lung Cancer (Squamous)', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '50')
    click_on('Find Trials')
    expect(page).to have_content("Phase III Randomized Trial")
  end

  scenario "render the correct results when given good input part 3" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage III', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '50')
    click_on('Find Trials')
    expect(page).to have_content("Phase III Randomized Trial")
  end

  scenario "render message for no results when search query matches no results" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Non-Small Cell Lung Cancer (Adenocarcinoma)', from: 'cancerSubType')
    select('Stage IV', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '50')
    click_on('Find Trials')
    expect(page).to have_content("Your search did not match any trials.")
  end
end
