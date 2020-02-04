require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a password" do
      user = User.new(email: "", password: "aaaa000", password_confirmation: "aaaa000")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end