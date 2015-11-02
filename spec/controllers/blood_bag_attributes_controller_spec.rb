require 'rails_helper'

RSpec.describe BloodBagAttributesController, type: :controller do

  include BloodBagAttributesHelper

  let(:blood_bags) { [ FactoryGirl.build(:blood_bag)]}
  let(:blood_bag_attribute) { FactoryGirl.build(:blood_bag_attribute) }
  let(:blood_bag_attributes) { [
      blood_bag_attribute,
      FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttrMinAfterStart: 15, bbat_ExtraInfo: 11),
      FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttrMinAfterStart: 30),
      FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttrMinAfterStart: 999),
  ]}
  let(:blood_bag_data_set) { BloodBagDataSet.new(blood_bags)}
  let(:blood_bag_attributes_data_set) { BloodBagAttributeDataSet.new(blood_bag_attributes)}
  let(:blood_bag_httparty_response) { build_httparty_response(blood_bag_data_set.ds_blood_bags) }
  let(:blood_bag_attributes_httparty_response) {
    build_httparty_response(blood_bag_attributes_data_set.ds_blood_bag_attributes)
  }

  before :each do
    # Stub login in user
    allow(controller).to receive(:current_user).and_return(FactoryGirl.build(:user))
    session[:user] = { login: 'bar', password: '1', language: 'en' }
    allow_any_instance_of(BloodBagService).to receive(:find_by_id).and_return(blood_bag_httparty_response)
    allow_any_instance_of(BloodBagAttributeService).to receive(:blood_bag_attributes).and_return(blood_bag_attributes_httparty_response)
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

  describe 'PATCH #update_all nested blood bag attributes for blood bag' do
    describe "valid attributes" do
      before(:each) do
        the_blood_bag_attributes = [ blood_bag_attribute ]
        patch :update_all, blood_bag_id: blood_bag_attribute.bbat_BloodBag,
              :blood_bag_attribute => {
                  blood_bag_attribute.to_param => FactoryGirl.attributes_for(:blood_bag_attribute, id: blood_bag_attribute.id, bbat_ExtraInfo: 99)
              },
              before_blood_bag_attributes: jsonify(the_blood_bag_attributes)
      end

      it "post the updated blood bag attributes data set to the remote rest service" do
        expect(true).to eq(false)
      end

      it "redirects to the index view (list of blood bag attributes)" do
        expect(response).to redirect_to blood_bag_blood_bag_attributes_url
      end

    end

  #   describe "invalid attributes" do
  #     before(:each) do
  #       patch :update_all, blood_bag_id: @blood_bag_attribute.bbat_BloodBag,
  #             id: @blood_bag_attribute, blood_bag_attribute: FactoryGirl.attributes_for(:blood_bag_attribute)
  #     end
  #
  #     # it "does not change @referral's person attributes" do
  #     #   expect(assigns[:referral]).to eq @referral
  #     # end
  #     #
  #     # it "re-renders the :edit method" do
  #     #   expect(response).to render_template :edit
  #     # end
  #   end
  end

end
