require 'rails_helper'

describe BloodBagService do

  let(:login) { 'foo'}
  let(:password) { 'bar'}
  let(:blood_bag_service) { BloodBagService.new(login, password)}
  let(:blood_bag_id) { 12345}
  let(:basic_auth_hash) { {:basic_auth=>{:username=>"#{login}@CyberTrack", :password=>"#{password}"}}}

  it 'find_by_id calls the httparty get method' do
    expect(BloodBagService).to receive(:get).with("/bloodbags/#{blood_bag_id}", basic_auth_hash)
    blood_bag_service.find_by_id(blood_bag_id)
  end
end
