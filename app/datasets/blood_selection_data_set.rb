require 'httparty'
require 'httparty_response'

class BloodSelectionDataSet
  include HTTPartyResponse

  attr_reader :response

  def initialize(httparty_response)
    @response = httparty_response
  end

  def tt_blood_selection
    ds_blood_selections['tt_BloodSelection'] if http_ok?
  end

  def ds_blood_selections
    @response['dsBloodselections'] if http_ok?
  end

  def blood_selections
    if http_ok?
      blood_selections = []
      tt_blood_selection.each { |blood_selection_hash| blood_selections << BloodSelection.new(blood_selection_hash) }
      blood_selections
    end
  end

end