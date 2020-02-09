require 'rails_helper'

RSpec.describe SignupController, type: :controller do

  describe "get #step1" do
    it "レスポンスが成功すること" do
      get :step1
      expect(response).to be_successful
    end

    it "200レスポンスを返すこと" do
      get :step1
      expect(response).to have_http_status "200"
    end
  end
end
