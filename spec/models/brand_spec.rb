require 'rails_helper'

RSpec.describe Brand, type: :model do
  context "Testing factory" do
    it { expect(build(:brand)).to be_valid}
  end

  context "Validating name" do
    it "should be invalid if nil" do
      expect(build(:brand, name: nil)).to be_invalid
    end
    it "should be invalid if repetead" do
      create(:brand, name: "Bic")
      expect(build(:brand, name: "Bic")).to be_invalid
    end
  end
end
