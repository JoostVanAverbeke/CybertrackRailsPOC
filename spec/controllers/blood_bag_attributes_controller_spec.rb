require 'rails_helper'

RSpec.describe BloodBagAttributesController, type: :controller do

  before :each do
    # Stub login in user
    allow(controller).to receive(:current_user).and_return(FactoryGirl.build(:user))
    session[:user] = { login: 'bar', password: '1', language: 'en' }
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, blood_bag_id: 456575, id: 1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, blood_bag_id: 456575
      expect(response).to have_http_status(:success)
    end
  end

  # describe "PATCH #update" do
  #   it "returns http success" do
  #     get :update, blood_bag_id: 456575
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
