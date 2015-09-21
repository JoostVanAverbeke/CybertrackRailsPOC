require 'rails_helper'

RSpec.describe PatientsController, type: :controller do

  before :each do
    # Stub login in user
    allow(controller).to receive(:current_user).and_return(FactoryGirl.build(:user))
    session[:user] = { login: 'bar', password: '1', language: 'en' }
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
