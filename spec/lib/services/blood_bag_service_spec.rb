require 'rails_helper'

describe BloodBagService do

  let(:blood_bag_service) { BloodBagService.new('foo', 'bar')}

  it 'find_by_id returns a fixed blood bag data set' do
    expect(blood_bag_service.find_by_id(12345)).not_to be_nil
  end
end
