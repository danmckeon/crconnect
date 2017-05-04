require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:bad_user) {FactoryGirl.create(:bad_user)}
  describe "instatiation" do
    it "adds a user to the database when created with good params" do
      expect {user}.to change{User.all.length}.by(1)
    end

    it "does not add a user to the database when created with bad params" do
      expect {bad_user}.to raise_error("Validation failed: Email can't be blank")
    end
  end
end
