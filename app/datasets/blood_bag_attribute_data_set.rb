require 'httparty'
require 'httparty_response'

class BloodBagAttributeDataSet
  include HTTPartyResponse

  attr_reader :blood_bag_attributes

  def initialize(blood_bag_attributes)
    @blood_bag_attributes = blood_bag_attributes
  end

  def self.parse(httparty_response)
    blood_bag_attributes = []
    if httparty_response.code == 200
      self.tt_blood_bag_attribute(httparty_response).each {
          |blood_bag_attribute_hash| blood_bag_attributes << BloodBagAttribute.new(blood_bag_attribute_hash)
      }
    end
    self.new(blood_bag_attributes)
  end

  def tt_blood_bag_attribute
    {
        'tt_BloodBagAttribute' => @blood_bag_attributes.map {
          |blood_bag_attribute| blood_bag_attribute.serializable_hash(except: [:id])
        }
    }
  end

  def ds_blood_bag_attributes
    { 'dsBloodBagAttributes' => tt_blood_bag_attribute }
  end

  private

  def self.tt_blood_bag_attribute(httparty_response)
    tt_blood_bag_attribute = []
    tt_blood_bag_attribute = self.ds_blood_bag_attributes(httparty_response)['tt_BloodBagAttribute'] if self.ds_blood_bag_attributes(httparty_response)
  end

  def self.ds_blood_bag_attributes(httparty_response)
    httparty_response['dsBloodBagAttributes']
  end



end