require 'rails_helper'

RSpec.describe Trial, type: :model do
  let(:trial) { FactoryGirl.create(:trial) }
  describe 'instatiation' do
    it 'persists in database' do
      expect(trial.created_at).not_to be_nil
    end

    it 'saves as "include" for squamous nsclc search' do
      expect(trial.type_lung_nsclc_squamous).to eq 'include'
    end
  end
end
