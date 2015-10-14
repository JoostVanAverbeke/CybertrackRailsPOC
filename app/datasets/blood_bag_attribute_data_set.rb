require 'httparty'
require 'httparty_response'

class BloodBagAttributeDataSet
  include HTTPartyResponse

  attr_reader :response

  def initialize(httparty_response)
    @response = httparty_response
  end

  def tt_blood_bag_attribute
    ds_blood_bag_attributes['tt_BloodBagAttribute'] if http_ok?
  end

  def ds_blood_bag_attributes
    @response['dsBloodBagAttributes'] if http_ok?
  end

  def blood_bag_attributes
    if http_ok?
      blood_bag_attributes = []
      tt_blood_bag_attribute.each {
          |blood_bag_attribute_hash| blood_bag_attributes << BloodBagAttribute.new(blood_bag_attribute_hash)
      }
      blood_bag_attributes
    end
  end

end