require 'httparty'

class BloodBagAttributeService
  include HTTParty
  include RestHelper

  base_uri "#{RestHelper.rest_root_url}"
  default_timeout 3

  def initialize(user, password)
    @auth = {username: user, password: password}
  end

  def blood_bag_attributes(blood_bag_id, options = {})
    options.merge!({basic_auth: @auth})
    catch_exceptions do
      self.class.get("/bloodbags/#{blood_bag_id}/attributes?type=Parameter", options)
    end
  end

end