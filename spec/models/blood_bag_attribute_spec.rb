require 'rails_helper'

describe BloodBagAttribute do
  let(:blood_bag_attribute) { BloodBagAttribute.new({
                                                        bbat_Id: 1, bbat_BloodBag: 12345,
                                                        bbat_BloodAttribute: 457349,
                                                        bbat_BloodAttributeMnemonic: "HBEAT",
                                                        bbat_BloodAttributeName: "Hart Beat",
                                                        bbat_ExtraInfo: nil
                                                    })
  }
  it 'to_s returns the object_id of the blood_bag_attribute object' do
    expect(blood_bag_attribute.to_s).to eq(blood_bag_attribute.object_id)
  end

  it 'to_json returns the json representation of the  blood_bag_attribute object' do
    expect(blood_bag_attribute.to_json).to "\"bbat_Id\":1,\"bbat_BloodBag\":12345,\"bbat_BloodAttribute\":457349,\"bbat_BloodAttributeMnemonic\":\"HBEAT\",\"bbat_BloodAttributeName\":\"Hart Beat\""
  end

  it 'updates the value of specified string representation of the attribute if it is known' do
    blood_bag_attribute.update_attribute('bbat_ExtraInfo', '120')
    expect(blood_bag_attribute.bbat_ExtraInfo).to eq('120')
  end

  it 'updates the value of specified symbol representation of the attribute if it is known' do
    blood_bag_attribute.update_attribute(:bbat_ExtraInfo, '24.7')
    expect(blood_bag_attribute.bbat_ExtraInfo).to eq('24.7')
  end

  it 'updates the value of specified symbol representation of the attribute if it is known' do
    blood_bag_attribute.update_attribute(:bbat_ExtraInfo, '24.7')
    expect(blood_bag_attribute.bbat_ExtraInfo).to eq('24.7')
  end

  it 'raises an exception when the attribute name is not known' do
    expect {
      blood_bag_attribute.update_attribute(:bbat_Unknown, '24.7')
    }.to raise_error(NoMethodError)
  end

end