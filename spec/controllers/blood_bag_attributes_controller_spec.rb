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

  describe 'PATCH #update_multiple nested blood bag attributes for blood bag' do
    describe "valid attributes" do
      before(:each) do
        patch :update_multiple, blood_bag_id: @blood_bag_attribute.bbat_BloodBag,
              id: @blood_bag_attribute, blood_bag_attribute: FactoryGirl.attributes_for(:blood_bag_attribute)
      end

      it "locates the requested @blood_bag_attributes of the blood bag" do
        expect(assigns(:blood_bag_attribute)).to eq(@blood_bag_attribute)
      end

      # it "redirects to the updated referral of the patient" do
      #   expect(response).to redirect_to(patient_referral_path(assigns(:patient), assigns(:referral)))
      # end
    end

    describe "invalid attributes" do
      before(:each) do
        patch :update_multiple, blood_bag_id: @blood_bag_attribute.bbat_BloodBag,
              id: @blood_bag_attribute, blood_bag_attribute: FactoryGirl.attributes_for(:blood_bag_attribute)
      end

      # it "does not change @referral's person attributes" do
      #   expect(assigns[:referral]).to eq @referral
      # end
      #
      # it "re-renders the :edit method" do
      #   expect(response).to render_template :edit
      # end
    end
  end

end
