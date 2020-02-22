require 'rails_helper'

RSpec.describe SignupController, type: :controller do

  describe "get #step1" do
    it "succeed in response" do
      get :step1
      expect(response).to be_successful
    end

    it "return 200 response" do
      get :step1
      expect(response).to have_http_status "200"
    end
  end

  describe "validates_step1" do
    context "valid data" do
      subject {
        user_params = attributes_for(:user)
        post :step2, params: {user: user_params},
                              session: {
                                nickname: 'test_user',
                                email: 'aaa@gmail',
                                password: 'aaaa0000',
                                password_confirmation: 'aaaa0000',
                              }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "redirect to step2" do
        subject
        expect(response).to render_template :step2
      end
    end

    context "invalid data" do
      subject {
        user_params = attributes_for(:user, nickname: '')
        post :step2, params: {user: user_params},
                              session: {
                              nickname: '',
                              email: 'aaa@gmail',
                              password: 'aaaa0000',
                              password_confirmation: 'aaaa0000'
                              }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "render to step1" do
        subject
        expect(response).to render_template :step1
      end
    end
  end


  describe 'get #step2' do
    before do
      get :step2, user: { name: 'sample_user',
                          email: "aaa@gmail.com",
                          password: "aaaa0000",
                          password_confirmation: "aaaa0000" }
    end

    it 'success in response' do
      expect(response).to be_successful
    end

    it 'return 200 response' do
      expect(response).to have_http_status "200"
    end
  end

  describe "validates_step2" do
    context "valid data" do
      subject {
        user_params = attributes_for(:user)
        post :step3, params: { user: user_params },
                    session: {
                      nickname: 'test_user',
                      email: 'aaa@gmail.com',
                      password: 'aaaa0000',
                      password_confirmation: 'aaaa0000',
                      cellphone: "08011112222"
                    }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "redirect to step3" do
        subject
        expect(response).to render_template :step3
      end
    end

    context "invalid data" do
      subject {
        user_params = attributes_for(:user, cellphone: '')
        post :step3, params: { user: user_params },
                    session: {
                      nickname: 'test_user',
                      email: 'aaa@gmail.com',
                      password: 'aaaa0000',
                      password_confirmation: 'aaaa0000',
                      cellphone: ''
                    }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "render to step2" do
        subject
        expect(response).to render_template :step2
      end
    end
  end

  
  describe 'get #step3' do
    before do
      get :step3, user: { name: 'sample_user',
                          email: "aaa@gmail.com",
                          password: "aaaa0000",
                          password_confirmation: "aaaa0000",
                          cellphone: '08011112222'
                        }
    end

    it 'success in response' do
      expect(response).to be_successful
    end

    it 'return 200 response' do
      expect(response).to have_http_status "200"
    end
  end

  describe "validates_step3" do
    context "valid data" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = attributes_for(:user)
        session["devise.regist_data"] = {user: @user}
        @address = attributes_for(:address)
        @user = @user.merge(address_attributes: @address)
      end
      subject {
        post :step4, params: { user: @user },
                     session: {
                          nickname: 'sample_user',
                          email: "aaa@gmail.com",
                          password: "aaaa0000",
                          password_confirmation: "aaaa0000",
                          cellphone: '08011112222',
                          familyname: 'sei',
                          firstname: 'mei',
                          familyname_kana: 'セイ',
                          firstname_kana: 'メイ',
                          birthday: '2000-01-01',
                          postcode: 1112222,
                          prefecture: '東京都',
                          municipality: '渋谷区',
                          address: '1-1'
                         }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "redirect to step4" do
        subject
        # session[:address_attributes] = FactoryBot.attributes_for( :address )
        expect(response).to render_template :step4
      end
    end

    context "invalid data" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = attributes_for(:user)
        session["devise.regist_data"] = {user: @user}
        @address = attributes_for(:address)
        @user = @user.merge(address_attributes: @address)
        @user[:familyname_kana] = nil
      end
      subject {
        post :step4, params: { user: @user },
                              session: {
                              nickname: 'test_user',
                              email: 'aaa@gmail.com',
                              password: 'aaaa0000',
                              password_confirmation: 'aaaa0000',
                              cellphone: '08011112222',
                              familyname: '',
                              firstname: '',
                              familyname_kana: '',
                              firstname_kana: '',
                              birthday: ''
                              }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "render to step3" do
        subject
        expect(response).to render_template :step3
      end
    end
  end


  describe 'get #step4' do
    before do
      get :step4, user: { name: 'sample_user',
                          email: "aaa@gmail.com",
                          password: "aaaa0000",
                          password_confirmation: "aaaa0000",
                          cellphone: '08011112222',
                          familyname: 'sei',
                          firstname: 'mei',
                          familyname_kana: 'セイ',
                          firstname_kana: 'メイ',
                          birthday: '2000-01-01',
                          postcode: '1112222',
                          prefecture: '東京都',
                          municipality: '渋谷区',
                          address: '1-1'
                          }
    end

    it 'success in response' do
      expect(response).to be_successful
    end

    it 'return 200 response' do
      expect(response).to have_http_status "200"
    end
  end

  describe "create" do
    context "valid data" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = attributes_for(:user)
        session["devise.regist_data"] = {user: @user}
        @address = attributes_for(:address)
        @user = @user.merge(address_attributes: @address)
        @card = attributes_for(:card)
        @user = @user.merge(card_attributes: @card)
      end
      subject {
        post :create, params: { user: @user },
                      session: {
                        nickname: 'test_user',
                        email: 'aaa@gmail.com',
                        password: 'aaaa0000',
                        password_confirmation: 'aaaa0000',
                        cellphone: "08011112222",
                        familyname: 'sei',
                        firstname: 'mei',
                        familyname_kana: 'セイ',
                        firstname_kana: 'メイ',
                        birthday: '2000-01-01',
                        address_attributes: @address,
                        postcode: 1112222,
                        prefecture: '東京都',
                        municipality: '渋谷区',
                        address: '1-1',
                        card_number: '1111222233334444',
                        expiration_month: '09',
                        expiration_year: '21',
                        security_code: '111'
                      }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "302"
      end

      it "redirect to done" do
        subject
        expect(response).to redirect_to done_signup_index_path
      end
    end

    context "invalid data" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = attributes_for(:user)
        session["devise.regist_data"] = {user: @user}
        @address = attributes_for(:address)
        @card = attributes_for(:card)
        @user = @user.merge(address_attributes: @address)
        @user = @user.merge(card_attributes: @card)
      end
      subject {
        post :create, params: {user: @user},
                              session: {
                              nickname: 'test_user',
                              email: 'aaa@gmail.com',
                              password: 'aaaa0000',
                              password_confirmation: 'aaaa0000',
                              cellphone: '08011112222',
                              familyname: 'sei',
                              firstname: 'mei',
                              familyname_kana: 'セイ',
                              firstname_kana: 'メイ',
                              birthday: '2000-01-01',
                              card_number: '',
                              expiration_month: '',
                              expiration_year: '',
                              security_code: ''
                              }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "render to step1" do
        subject
        expect(response).to render_template :step1
      end
    end
  end
end