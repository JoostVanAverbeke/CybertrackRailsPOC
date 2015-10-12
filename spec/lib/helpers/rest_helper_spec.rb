require 'rails_helper'
require 'rest_helper'


describe RestHelper do

  module RestHelperTest
    class DummyClass

      def get(exception = false)
        if exception
          raise HTTParty::Error
        end
      end

    end
  end

  let(:dummy_object) {
    object = RestHelperTest::DummyClass.new
    object.extend(RestHelper)
    object
  }

  it 'catch_exceptions raises a RemoteRestError when the given block raises an HTTParty::Error exception' do
    expect {
      dummy_object.catch_exceptions do
        dummy_object.get(true)
      end
    }.to raise_error(RemoteRestError)
  end

  it 'catch_exceptions executes the given block when the given block does not raise an HTTParty::Error exception' do
    expect {
      dummy_object.catch_exceptions do
        dummy_object.get
      end
    }.not_to raise_error
  end

end