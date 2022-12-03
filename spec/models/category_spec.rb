require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Testing factory" do
    it { expect(build(:category)).to be_valid}
  end

  context "Validating name" do
    it "should be invalid if nil" do
      expect(build(:category, name: nil)).to be_invalid
    end
    it "should be invalid if repetead" do
      create(:category, name: "Marcadores")
      expect(build(:category, name: "Marcadores")).to be_invalid
    end
  end
end
