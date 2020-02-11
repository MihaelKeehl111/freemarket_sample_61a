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
        post :step2, params: { user: user_params },
                               session: {
                                 nickname: 'test_user',
                                 email: 'aaa@gmail',
                                 password: 'aaaa0000',
                                 password_confirmation: 'aaaa0000'
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
        user_params = attributes_for(:user, nickname: "")
        post :step2, params: { user: user_params},
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
end
