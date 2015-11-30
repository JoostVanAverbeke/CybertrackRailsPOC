require 'httparty'

class BloodBagAttributeService
  include HTTParty
  include RestHelper

  base_uri "#{RestHelper.rest_root_url}"
  default_timeout 3
  logger Rails.logger
  debug_output $stderr if Rails.env.development?

  def initialize(user, password)
    @auth = create_auth_hash(user, password)
  end

  def blood_bag_attributes(blood_bag_id, options = {})
    options.merge!({basic_auth: @auth})
    # catch_exceptions do
    #  self.class.get("/bloodbags/#{blood_bag_id}/attributes?type=Parameter", options)
    # end
    # TODO(JVA) Dummy implementation, since the Glims BTMService doesn't yet support this REST API
    build_httparty_response(ds_blood_bag_attributes)

  end

  def put_blood_bag_attribute_data_set(blood_bag_id, blood_bag_attribute_data_set)
    options = {
        headers: {
            'Content-Type' => 'application/json'
        },
        body: {
            request: blood_bag_attribute_data_set.ds_blood_bag_attributes
        }.to_json
    }
    options.merge!({basic_auth: @auth})
    BloodBagAttributeService.put("/bloodbags/#{blood_bag_id}/attributes", options)
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
  attr_accessor :id,
                :bbat_Id, :bbat_BloodBag,
                :bbat_BloodAttribute,
                :bbat_BloodAttributeMnemonic, :bbat_BloodAttributeName,
                :bbat_BloodAttrMinAfterStart, :bbat_BloodAttributeIsMandatory,
                :bbat_ExtraInfo,:bbat_Present

  def blood_bag_attribute_1
    { "bbat_Id" =>  1, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  12345,
      "bbat_BloodAttributeMnemonic" => "HBEAT0", "bbat_BloodAttributeName" => "Hart Beat",
      "bbat_BloodAttrMinAfterStart" => 0, "bbat_ExtraInfo"  => "95" }
  end

  def blood_bag_attribute_2
    { "bbat_Id" =>  2, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  12346,
      "bbat_BloodAttributeMnemonic" => "HBEAT15", "bbat_BloodAttributeName" => "Hart Beat",
      "bbat_BloodAttrMinAfterStart" => 15, "bbat_ExtraInfo"  => nil }
  end

  def blood_bag_attribute_3
    { "bbat_Id" =>  3, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  12347,
      "bbat_BloodAttributeMnemonic" => "HBEAT30", "bbat_BloodAttributeName" => "Hart Beat",
      "bbat_BloodAttrMinAfterStart" => 30, "bbat_ExtraInfo"  => "70" }
  end

  def blood_bag_attribute_4
    { "bbat_Id" =>  1, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  12348,
      "bbat_BloodAttributeMnemonic" => "BLDPRESSURE0", "bbat_BloodAttributeName" => "Blood pressure",
      "bbat_BloodAttrMinAfterStart" => 0, "bbat_ExtraInfo"  => "65" }
  end

  def blood_bag_attribute_5
    { "bbat_Id" =>  2, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  12349,
      "bbat_BloodAttributeMnemonic" => "BLDPRESSURE15", "bbat_BloodAttributeName" => "Blood pressure",
      "bbat_BloodAttrMinAfterStart" => 15, "bbat_ExtraInfo"  => '105' }
  end

  def blood_bag_attribute_6
    { "bbat_Id" =>  3, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  12350,
      "bbat_BloodAttributeMnemonic" => "BLDPRESSURE30", "bbat_BloodAttributeName" => "Blood pressure",
      "bbat_BloodAttrMinAfterStart" => 30, "bbat_ExtraInfo"  => '110' }
  end

  def blood_bag_attribute_7
    { "bbat_Id" =>  1, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  12351,
      "bbat_BloodAttributeMnemonic" => "COLOR0", "bbat_BloodAttributeName" => "Color",
      "bbat_BloodAttrMinAfterStart" => 0, "bbat_ExtraInfo"  => "White" }
  end

  def blood_bag_attribute_8
    { "bbat_Id" =>  2, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  12352,
      "bbat_BloodAttributeMnemonic" => "COLOR15", "bbat_BloodAttributeName" => "Color",
      "bbat_BloodAttrMinAfterStart" => 15, "bbat_ExtraInfo"  => 'Blue' }
  end

  def blood_bag_attribute_9
    { "bbat_Id" =>  3, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  123453,
      "bbat_BloodAttributeMnemonic" => "COLOR30", "bbat_BloodAttributeName" => "Color",
      "bbat_BloodAttrMinAfterStart" => 30, "bbat_ExtraInfo"  => 'Red' }
  end

  def blood_bag_attribute_10
    { "bbat_Id" =>  3, "bbat_BloodBag" =>  456575, "bbat_BloodAttribute" =>  12354,
      "bbat_BloodAttributeMnemonic" => "BLDPRESSURE9999", "bbat_BloodAttributeName" => "Blood pressure",
      "bbat_BloodAttrMinAfterStart" => 9999, "bbat_ExtraInfo"  => nil }
  end

  def blood_bag_attribute_array
    [
        blood_bag_attribute_1,
        blood_bag_attribute_2,
        blood_bag_attribute_3,
        blood_bag_attribute_4,
        blood_bag_attribute_5,
        blood_bag_attribute_6,
        blood_bag_attribute_7,
        blood_bag_attribute_8,
        blood_bag_attribute_9,
        blood_bag_attribute_10
    ]
  end

  def tt_blood_bag_attribute
    {"tt_BloodBagAttribute" => blood_bag_attribute_array }
  end

  def ds_blood_bag_attributes
    {"dsBloodBagAttributes" => tt_blood_bag_attribute }
  end

end