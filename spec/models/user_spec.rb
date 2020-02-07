require 'rails_helper'

describe User do
  describe '#create' do

    it "is valid with a email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a password that has less than 6 characters" do
      user = build(:user, password: "abcd12", password_confirmation: "abcd12")
      user.valid?
      expect(user.errors[:password]).to include("７文字以上の英数混在で入力してください。")
    end

    it "is invalid with a password that has more than 7 characters but has only number" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("７文字以上の英数混在で入力してください。")
    end

    it "is invalid with a password that has more than 7 characters but has only letter" do
      user = build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      user.valid?
      expect(user.errors[:password]).to include("７文字以上の英数混在で入力してください。")
    end

    it "is valid with a password that has more than 7 characters an has both of number and letter" do
      user = build(:user, password: "abcd123", password_confirmation: "abcd123")
      user.valid?
      expect(user).to be_valid
    end

  end
end