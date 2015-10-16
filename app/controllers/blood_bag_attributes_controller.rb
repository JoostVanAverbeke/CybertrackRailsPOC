class BloodBagAttributesController < ApplicationController
  before_action :authenticate_user!, :basic_auth_credentials
  before_action :find_blood_bag

  def show
  end

  def index
    blood_bag_attributes_service = BloodBagAttributeService.new(session_login_user, session_password_user)
    response = blood_bag_attributes_service.blood_bag_attributes(@blood_bag.bbag_Id)
    if response.code == 200
      @blood_bag_attributes = BloodBagAttributeDataSet.new(response).blood_bag_attributes
    end

  end

  def edit_all
    blood_bag_attributes_service = BloodBagAttributeService.new(session_login_user, session_password_user)
    response = blood_bag_attributes_service.blood_bag_attributes(@blood_bag.bbag_Id)
    if response.code == 200
      @blood_bag_attributes = BloodBagAttributeDataSet.new(response).blood_bag_attributes
    end
  end

  def update_all
    if params['before_blood_bag_attributes']
      my_hash = JSON.parse(params['before_blood_bag_attributes'])
      puts "my_hash = #{my_hash.inspect}"
      before_blood_bag_attributes = []
      my_hash.each do |blood_bag_attribute_hash|
        before_blood_bag_attributes << BloodBagAttribute.new(blood_bag_attribute_hash)
      end
    end
    puts "params = #{params['blood_bag_attribute'].inspect}"
    puts "keys = #{params['blood_bag_attribute'].keys.inspect}"

    params['blood_bag_attribute'].keys.each do |id|
      puts "id = #{id} params = #{params['blood_bag_attribute'][id]}"
      # update the user via the remote rest service
      # @user = User.find(id.to_i)
      # @user.update_attributes(params['user'][id])
    end
    redirect_to blood_bag_blood_bag_attributes_url
  end

  private

  def find_blood_bag
    blood_bag_service = BloodBagService.new(session_login_user, session_password_user)
    response = blood_bag_service.find_by_id(params[:blood_bag_id])
    if response.code == 200
      @blood_bag = BloodBagDataSet.new(response).blood_bags.first
    end
  end
end
