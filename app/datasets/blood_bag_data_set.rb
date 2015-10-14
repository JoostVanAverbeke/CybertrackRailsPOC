require 'httparty'
require 'httparty_response'

class BloodBagDataSet
  include HTTPartyResponse

  attr_reader :response

  def initialize(httparty_response)
    @response = httparty_response
  end

  def tt_blood_bag
    ds_blood_bags['tt_BloodBag'] if http_ok?
  end

  def ds_blood_bags
    @response['dsBloodBags'] if http_ok?
  end

  def blood_bags
    if http_ok?
      blood_bags = []
      tt_blood_bag.each {
          |blood_bag_hash| blood_bags << BloodBag.new(blood_bag_hash)
      }
      blood_bags
    end
  end

end