require 'rails_helper'
require 'httparty_response'

class DummyClass

  attr_reader :response

  def initialize(httpart_response)
    @response = httpart_response
  end
end


describe HTTPartyResponse do

  before :each do
    @dummy_object = DummyClass.new(build_httparty_response({"foo" => "bar"}))
    @dummy_object.extend(HTTPartyResponse)
  end
  it 'returns true if the http response code is 200' do
    expect(@dummy_object.http_ok?).to be_truthy
  end
end