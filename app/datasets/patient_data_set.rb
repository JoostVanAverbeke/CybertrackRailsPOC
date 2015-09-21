require 'httparty'
require 'httparty_response'

class PatientDataSet
  include HTTPartyResponse

  attr_reader :response

  def initialize(httparty_response)
    @response = httparty_response
  end

  def tt_person
    ds_patient['tt_Person'] if http_ok?
  end

  def ds_patient
    @response['dsPatients'] if http_ok?
  end

  def patients
    if http_ok?
      patients = []
      tt_person.each { |patient_hash| patients << Patient.new(patient_hash) }
      patients
    end
  end
end