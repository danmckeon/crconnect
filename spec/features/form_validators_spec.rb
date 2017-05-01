require 'rails_helper'

RSpec.feature "Form Validators", type: :feature, js: true do
  scenario "shows correct error messages on individual invalid input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '25')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Cancer Type')

    select('Lung Cancer', from: 'cancerType')
    select('(Please select sub-type)', from: 'cancerSubType')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Cancer Sub Type')

    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('(Please select stage)', from: 'cancerStage')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Cancer Stage')

    select('Stage II', from: 'cancerStage')
    select('(Please select yes or no)', from: 'chemotherapy')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Chemotherapy')

    select('No', from: 'chemotherapy')
    select('(Please select yes or no)', from: 'radiation')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Radiation')
  end

  scenario "shows multiple error messages on multiple pieces of missing input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'radiation')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Cancer Type')
    expect(page).to have_content('Please select an option for Chemotherapy')
    expect(page).to have_content('Please enter a number between 1 and 150 for age')
    select('No', from: 'chemotherapy')
    select('Non-Small Cell Lung Cancer (Squamous)', from: 'cancerSubType')
    fill_in('age', with: '90')
    expect(page).to have_content('Please select an option for Cancer Type')
  end

  scenario "allows user to submit form after previously receiving errors" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'radiation')
    fill_in('age', with: '25')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Cancer Type')
    expect(page).to have_content('Please select an option for Chemotherapy')
    select('Lung Cancer', from: 'cancerType')
    select('No', from: 'chemotherapy')
    click_on('Find Trials')
    expect(page).to have_content('Showing clinical trials for')
  end
end
