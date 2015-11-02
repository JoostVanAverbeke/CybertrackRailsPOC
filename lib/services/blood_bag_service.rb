require 'httparty'

class BloodBagService
  include HTTParty
  include RestHelper

  base_uri "#{RestHelper.rest_root_url}"
  default_timeout 3
  logger Rails.logger

  def initialize(user, password)
    @auth = create_auth_hash(user, password)
  end

  def find_by_id(id, options = {})
    options.merge!({basic_auth: @auth})
    catch_exceptions do
      self.class.get("/bloodbags/#{id}", options)
    end
#   TODO(JVA) Dummy implementation, since the Glims BTMService doesn't yet support this REST API
#    build_httparty_response(ds_blood_bags)
  end

  private

  def build_httparty_response(hash, http_status_code = 200)
    last_modified = Date.new(2010, 1, 15).to_s
    content_length = '1024'
    request_object = HTTParty::Request.new Net::HTTP::Get, '/'
    response_object = Net::HTTPOK.new('1.1', http_status_code, 'OK')
    # response_object.body = hash.to_s
    response_object['last-modified'] = last_modified
    response_object['content-length'] = content_length
    parsed_response = lambda { hash }
    response = HTTParty::Response.new(request_object, response_object, parsed_response, { body: hash.to_s })
  end

  def blood_bag_1
    { "bbag_Id" =>  456575, "bbag_BloodProduct" =>  12345, "bbag_BloodProductMnemonic" =>  "ERYTROCYT"}
  end

  def blood_bag_array
    [ blood_bag_1]
  end

  def tt_blood_bag
    {"tt_BloodBag" => blood_bag_array }
  end

  def ds_blood_bags
    {"dsBloodBags" => tt_blood_bag }
  end

end