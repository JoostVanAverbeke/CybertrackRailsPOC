require 'httparty'
require 'httparty_response'

class BloodBagDataSet
  include HTTPartyResponse

  attr_reader :blood_bags

  def self.parse(httparty_response)
    blood_bags = []
    if httparty_response.code == 200
      self.tt_blood_bag(httparty_response).each {
          |blood_bag_hash| blood_bags << BloodBag.new(blood_bag_hash)
      }
    end
    self.new(blood_bags)
  end

  def initialize(blood_bags)
    @blood_bags = blood_bags
  end

  def tt_blood_bag
    { 'tt_BloodBag' => @blood_bags.map { |blood_bag| blood_bag.serializable_hash} }
  end

  def ds_blood_bags
    { 'dsBloodBags' => tt_blood_bag }
  end

  private

  def self.tt_blood_bag(httparty_response)
    tt_blood_bag = []
    tt_blood_bag = self.ds_blood_bags(httparty_response)['tt_BloodBag'] if self.ds_blood_bags(httparty_response)
  end

  def self.ds_blood_bags(httparty_response)
    httparty_response['dsBloodBags']
  end

end