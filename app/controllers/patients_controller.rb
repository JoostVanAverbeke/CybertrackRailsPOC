class PatientsController < ApplicationController
  before_action :authenticate_user!, :basic_auth_credentials

#  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    if mobile_device? && current_user?
      patient_service = BloodSelectionService.new(session_login_user, session_password_user)
      response = patient_service.patients
      if response.code == 200
        patient_data_set = PatientDataSet.new(response)
        @patients = patient_data_set.patients.sort_by! do |patient|
          patient.prsn_Externalization
        end
      end
    end
  end
end
