class BloodSelectionsController < ApplicationController
  before_action :authenticate_user!, :basic_auth_credentials
  before_action :find_patient, only: [:index, :show]

  def index
    blood_selection_service = BloodSelectionService.new(session_login_user, session_password_user)
    response = blood_selection_service.blood_selections(@patient.prsn_Object)
    if response.code == 200
      @blood_selections = BloodSelectionDataSet.new(response).blood_selections
    end
  end

  def show
  end

  private

  def find_patient
    patient_service = PatientService.new(session_login_user, session_password_user)
    response = patient_service.find_by_id(params[:patient_id])
    if response.code == 200
      @patient = PatientDataSet.new(response).patients.first
    end
  end
end
