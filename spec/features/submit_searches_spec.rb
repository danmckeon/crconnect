require 'rails_helper'

RSpec.feature "SubmitSearches", type: :feature, js: true do
  before(:each) do
    FactoryGirl.create(:happy_submit)
    FactoryGirl.create(:grumpy_submit)
    FactoryGirl.create(:submission)
    FactoryGirl.create(:submission2)
    FactoryGirl.create(:excited_submit)
  end

  scenario "render results page on search submit" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    fill_in('age', with: '25')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content('Showing clinical trials for')
  end

  scenario "render some results when given good input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Non-Small Cell Lung Cancer (Large Cell)', from: 'cancerType')
    select('Stage IV', from: 'cancerStage')
    select('Yes', from: 'chemotherapy')
    select('Yes', from: 'radiation')
    fill_in('age', with: '16')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content('Showing clinical trials for')
  end

  scenario "render the correct results when given good input" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Non-Small Cell Lung Cancer (Adenocarcinoma)', from: 'cancerType')
    select('Stage I', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('Refractory', from: 'cancerStatus')
    fill_in('age', with: '50')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content("Randomized Phase II")
  end

  scenario "render the correct results when given good input part 2" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Non-Small Cell Lung Cancer (Squamous)', from: 'cancerType')
    select('Stage II', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('Never Received Treatment', from: 'cancerStatus')
    fill_in('age', with: '50')
    click_on('Find Trials')
    expect(page).to have_content("Phase III Randomized Trial")
  end

  scenario "render the correct results when given good input part 3" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerType')
    select('Stage III', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('Relapsed', from: 'cancerStatus')
    fill_in('age', with: '50')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content("Phase III Randomized Trial")
  end

  scenario "render the correct results when given good input part 4 (genetic markers)" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerType')
    select('Stage III', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('None', from: 'geneticMarkers')
    fill_in('age', with: '50')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content("Study of the effects of the Phase on the status")
  end

  scenario "render the correct results when given good input part 5 (genetic markers)" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerType')
    select('Stage III', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('ALK Oncogene', from: 'geneticMarkers')
    fill_in('age', with: '50')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content("Very important study")
  end

  scenario "render the correct results when given good input part 6 (genetic markers)" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerType')
    select('Stage III', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('EGFR Mutation', from: 'geneticMarkers')
    fill_in('age', with: '50')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content("Very important study")
  end

  scenario "render the correct results when given good input part 7 (genetic markers)" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Small Cell Lung Cancer', from: 'cancerType')
    select('Stage III', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('KRAS Mutation', from: 'geneticMarkers')
    fill_in('age', with: '50')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content("Very important study")
  end

  scenario "render the correct results when given good input part 8 (colorectal adeno)" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Colorectal Cancer (Adenocarcinoma)', from: 'cancerType')
    select('Stage III', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('KRAS Mutation', from: 'geneticMarkers')
    fill_in('age', with: '50')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content("Fairly important study")
  end

  scenario "render the correct results when given good input part 9 (colorectal nonadeno)" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Colorectal Cancer (Other types)', from: 'cancerType')
    select('Stage III', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('KRAS Mutation', from: 'geneticMarkers')
    fill_in('age', with: '50')
    fill_in('zipcode', with: '98117')
    click_on('Find Trials')
    expect(page).to have_content("Fairly important study")
    expect(page).to have_no_content("Zipcode")
    page.find(".trial-buttons").click
    expect(page).to have_content("More info")
  end

  scenario "render message for no results when search query matches no results" do
    visit('/')
    page.driver.browser.switch_to.alert.accept
    select('Non-Small Cell Lung Cancer (Adenocarcinoma)', from: 'cancerType')
    select('Stage IV', from: 'cancerStage')
    select('No', from: 'chemotherapy')
    select('No', from: 'radiation')
    select('Refractory', from: 'cancerStatus')
    fill_in('age', with: '50')
    fill_in('zipcode', with: '98104')
    click_on('Find Trials')
    expect(page).to have_content('98104')
    expect(page).to have_content("Your search did not match any trials.")
  end
end
