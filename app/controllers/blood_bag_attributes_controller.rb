class BloodBagAttributesController < ApplicationController
  before_action :authenticate_user!, :basic_auth_credentials
  before_action :find_blood_bag, :setup_blood_bag_attribute_service

  def show
  end

  def index
    @patient_id = params['patient_id']
    response = @blood_bag_attribute_service.blood_bag_attributes(@blood_bag.bbag_Id)
    if response.code == 200
      @blood_bag_attributes = BloodBagAttributeDataSet.parse(response).blood_bag_attributes
    end

  end

  def edit_all
    response = @blood_bag_attribute_service.blood_bag_attributes(@blood_bag.bbag_Id)
    if response.code == 200
      @blood_bag_attributes = BloodBagAttributeDataSet.parse(response).blood_bag_attributes
    end
  end

  def update_all
    before_blood_bag_attributes = parse_blood_bag_attributes_params(params['before_blood_bag_attributes'])
    params['blood_bag_attribute'].keys.each do |id|
      puts "id = #{id} params = #{params['blood_bag_attribute'][id]}"
      blood_bag_attribute = before_blood_bag_attributes.select {
          |blood_bag_attribute| blood_bag_attribute.id == id.to_i
      }.first
      blood_bag_attribute.update_attributes(params['blood_bag_attribute'][id])
    end
    response = @blood_bag_attribute_service.put_blood_bag_attribute_data_set(@blood_bag.bbag_Id,
      BloodBagAttributeDataSet.new(before_blood_bag_attributes))
    redirect_to blood_bag_blood_bag_attributes_url
  end

  private

  def find_blood_bag
    blood_bag_service = BloodBagService.new(session_login_user, session_password_user)
    response = blood_bag_service.find_by_id(params[:blood_bag_id])
    if response.code == 200
      @blood_bag = BloodBagDataSet.parse(response).blood_bags.first
    end
  end

  def setup_blood_bag_attribute_service
    @blood_bag_attribute_service = BloodBagAttributeService.new(session_login_user, session_password_user)
  end

  def parse_blood_bag_attributes_params(blood_bag_attributes_params)
    blood_bag_attributes = []
    if blood_bag_attributes_params
      blood_bag_attributes_hash = JSON.parse(blood_bag_attributes_params)
      blood_bag_attributes_hash.each do |blood_bag_attribute_hash|
        blood_bag_attributes << BloodBagAttribute.new(blood_bag_attribute_hash)
      end
    end
    blood_bag_attributes
  end
end
