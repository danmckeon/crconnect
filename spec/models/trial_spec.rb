require 'rails_helper'

describe Trial do
  describe 'instantiaion' do
    let(:owner) {User.create(name: "Jorel", email: "jorel@gmail.com", password: "123", role: "owner")}
    let(:staff1) {User.create(name: "Juan", email: "juan@gmail.com", password: "123", role: "staff")}
    let(:staff2) {User.create(name: "April", email: "april@gmail.com", password: "123", role: "staff")}
    let(:experiment) {Experiment.create(title: "Autogenics", summary: "Say the word, feel better", staff_needed: 5)}

    it 'has users' do
      experiment.users << [owner, staff1]
      expect(experiment.users.length).to eq 2
    end
    it 'has an owner' do
      experiment.users << owner
      expect(experiment.owner).to eq owner
    end
    it 'has staff' do
      experiment.users << [staff1, staff2]
      expect(experiment.staff.length).to eq 2
    end
  end
end
