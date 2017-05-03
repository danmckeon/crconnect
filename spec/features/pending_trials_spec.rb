require 'rails_helper'

RSpec.feature "PendingTrials", type: :feature, js: true do
  describe "when you visit the admin portal pending trials page " do
    it "has 'Pending Trials' as a header" do
      visit("/admin/trials/pending")
      expect(page).to have_content("Pending Trials")
    end
  end
end
