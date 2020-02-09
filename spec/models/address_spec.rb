require 'rails_helper'

RSpec.describe Address, type: :model do
  it "is valid with a postcode, prefecture, municipality, address, building" do
    address = build(:address)
    expect(address).to be_valid
  end

  it "is invalid without a postcode" do
    address = build(:address, postcode: "")
    address.valid?
    expect(address.errors[:postcode]).to include("can't be blank")
  end
  it "is invalid without a prefecture" do
    address = build(:address, prefecture: "")
    address.valid?
    expect(address.errors[:prefecture]).to include("can't be blank")
  end
end
