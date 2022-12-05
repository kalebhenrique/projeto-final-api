require 'rails_helper'

RSpec.describe Product, type: :model do
  context "Testing factory" do
    it {expect(build(:product)).to be_valid}
  end

  context "Validating name" do
    it "should be invalid if nil" do
      expect(build(:product, name:nil)).to be_invalid
    end
    it "should be invalid if repeated" do
      create(:product, name: "Caneta azul")
      expect(build(:product, name:"Caneta azul")).to be_invalid
    end
  end

  context "Validating description" do
    it "should be invalid if nil" do
      expect(build(:product, description:nil)).to be_invalid
    end
  end

  context "Validating price_in_cents" do
    it "should be invalid if nil" do
      expect(build(:product, price_in_cents:nil)).to be_invalid
    end
    it "should be invalid if negative" do
      expect(build(:product, price_in_cents:-1)).to be_invalid
    end
  end

  context "Validating inventory" do
    it "should be invalid if nil" do
      expect(build(:product, inventory:nil)).to be_invalid
    end
    it "should be invalid if negative" do
      expect(build(:product, inventory:-1)).to be_invalid
    end
  end

  context "Validating brand" do
    it "should be invalid if nil" do
      expect(build(:product, brand:nil)).to be_invalid
    end
    it "should be invalid if doesn't exist" do
      expect(build(:product, brand_id:-1)).to be_invalid
    end
  end

  context "Validating category" do
    it "should be invalid if nil" do
      expect(build(:product, category:nil)).to be_invalid
    end
    it "should be invalid if doesn't exist" do
      expect(build(:product, category_id:-1)).to be_invalid
    end
  end
end
