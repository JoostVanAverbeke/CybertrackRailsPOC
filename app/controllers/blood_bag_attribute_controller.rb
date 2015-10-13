class BloodBagAttributeController < ApplicationController
  before_action :authenticate_user!, :basic_auth_credentials
  before_action :find_blood_bag

  def show
  end

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
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
