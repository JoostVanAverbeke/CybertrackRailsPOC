require 'httparty'
require 'httparty_response'

class PatientDataSet
  include HTTPartyResponse

  attr_reader :patients

  def self.parse(httparty_response)
    patients = []
    if httparty_response.code == 200
      self.tt_person(httparty_response).each {
          |patient_hash| patients << Patient.new(patient_hash)
      }
    end
    self.new(patients)
  end

  def initialize(patients)
    @patients = patients
  end

  def tt_person
    { 'tt_Person' => @patients }
  end

  # TODO(JVA) this is a very ugly implementation.
  # We should fix the GLIMS REST remote services
  def ds_patient
    { 'dsPatients' => tt_person}
  end

  private

  def self.tt_person(httparty_response)
    tt_person = []
    tt_person = self.ds_patients(httparty_response)['tt_Person'] if self.ds_patients(httparty_response)
  end

  # TODO(JVA) this is a very ugly implementation.
  # We should fix the GLIMS REST remote services
  def self.ds_patients(httparty_response)
    httparty_response['dsPatients'] ? httparty_response['dsPatients'] : httparty_response['dsPerson']
  end
end