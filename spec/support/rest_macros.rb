require 'httparty'

module RestMacros
  def build_httparty_response(hash, http_status_code = 200)
    last_modified = Date.new(2010, 1, 15).to_s
    content_length = '1024'
    request_object = HTTParty::Request.new Net::HTTP::Get, '/'
    response_object = Net::HTTPOK.new('1.1', http_status_code, 'OK')
    allow(response_object).to receive_messages(body: hash.to_s)
    response_object['last-modified'] = last_modified
    response_object['content-length'] = content_length
    parsed_response = lambda { hash }
    response = HTTParty::Response.new(request_object, response_object, parsed_response)
  end
end