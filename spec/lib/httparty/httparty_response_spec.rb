require 'rails_helper'
require 'httparty_response'



describe HTTPartyResponse do
  module HTTPartyResponseTest
    class DummyClass

      attr_reader :response

      def initialize(httpart_response)
        @response = httpart_response
      end

    end
  end

  let(:dummy_object) {
    the_object = HTTPartyResponseTest::DummyClass.new(build_httparty_response({"foo" => "bar"}))
    the_object.extend(HTTPartyResponse)
    the_object
  }

  it 'returns true if the http response code is 200' do
    expect(dummy_object.http_ok?).to be_truthy
  end

end