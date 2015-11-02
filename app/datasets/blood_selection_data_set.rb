require 'httparty'
require 'httparty_response'

class BloodSelectionDataSet
  include HTTPartyResponse

  attr_reader :blood_selections

  def self.parse(httparty_response)
    blood_selections = []
    if httparty_response.code == 200
      self.tt_blood_selection(httparty_response).each {
          |blood_selection_hash| blood_selections << BloodSelection.new(blood_selection_hash)
      }
    end
    self.new(blood_selections)
  end

  def initialize(blood_selections)
    @blood_selections = blood_selections
  end

  def tt_blood_selection
    { 'tt_BloodSelection' => @blood_selections }
  end

  def ds_blood_selections
    { 'dsBloodselections' => tt_blood_selection }
  end

  private

  def self.tt_blood_selection(httparty_response)
    tt_blood_selection = []
    tt_blood_selection = self.ds_blood_selections(httparty_response)['tt_BloodSelection'] if self.ds_blood_selections(httparty_response)
  end

  def self.ds_blood_selections(httparty_response)
    httparty_response['dsBloodselections']
  end
end