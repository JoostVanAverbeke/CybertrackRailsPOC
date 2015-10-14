require 'rails_helper'

describe BloodBagDataSet do
  let(:blood_bag_1) {
    { "bbag_Id" =>  1, "bbag_BloodProduct" =>  456575, "bbag_BloodProductMnemonic" =>  "ERYTROCYT"}
  }

  let(:blood_bag_2) {
    { "bbag_Id" =>  2, "bbag_BloodProduct" =>  456573, "bbag_BloodProductMnemonic" =>  "SERUM"}
  }
  let(:blood_bag_array) {
    [ blood_bag_1, blood_bag_2]
  }

  let(:tt_blood_bag) {
    {"tt_BloodBag" => blood_bag_array }
  }

  let(:ds_blood_bags) {
    {"dsBloodBags" => tt_blood_bag }
  }

  let(:blood_bag_data_set) { BloodBagDataSet.new(build_httparty_response(ds_blood_bags))}

  it 'returns \'dsBloodBags\' sub element from the httparty response' do
    expect(blood_bag_data_set.ds_blood_bags).to eq(tt_blood_bag)
  end

  it 'returns the \'tt_BloodBag\' sub element from the httparty response' do
    expect(blood_bag_data_set.tt_blood_bag.length).to eq(2)
    expect(blood_bag_data_set.tt_blood_bag).to eq(blood_bag_array)
  end

  it 'returns an array of BloodBag model instances constructed from the json items in tt_BloodBag' do
    expect(blood_bag_data_set.blood_bags).not_to be_nil
    expect(blood_bag_data_set.blood_bags.length).to eq(2)
    expect(blood_bag_data_set.blood_bags[0]).to be_an_instance_of(BloodBag)
  end

end
