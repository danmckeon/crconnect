require 'rails_helper'

RSpec.feature "Form Validators", type: :feature, js: true do
  scenario "shows error on invalid cancer type input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '25')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Cancer Type')
  end

  scenario "shows error on invalid cancer subtype input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '25')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Cancer Sub Type')
  end

  scenario "shows error on invalid stage input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '25')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Cancer Stage')
  end

  scenario "shows error on invalid chemotherapy input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'radiation')
    fill_in('age', with: '25')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Chemotherapy')
  end

  scenario "shows error on invalid radiation input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    fill_in('age', with: '25')
    click_on('Find Trials')
    expect(page).to have_content('Please select an option for Radiation')
  end

  scenario "shows error on invalid age input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Lung Cancer', from: 'cancerType')
    select('Small Cell Lung Cancer', from: 'cancerSubType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    click_on('Find Trials')
    expect(page).to have_content('Please enter a number between 1 and 150 for age')
    fill_in('age', with: 'a')
    click_on('Find Trials')
    expect(page).to have_content('Please enter a number between 1 and 150 for age')
    fill_in('age', with: '151')
    click_on('Find Trials')
    expect(page).to have_content('Please enter a number between 1 and 150 for age')
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
