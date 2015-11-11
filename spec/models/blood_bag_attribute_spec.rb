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
    expect(blood_bag_attribute.to_s).to eq(blood_bag_attribute.object_id.to_s)
  end

  it 'to_json returns the json representation of the  blood_bag_attribute object' do
    expect(blood_bag_attribute.to_json).to match(/\"bbat_Id\":1,\"bbat_BloodBag\":12345,\"bbat_BloodAttribute\":457349,\"bbat_BloodAttributeMnemonic\":\"HBEAT\",\"bbat_BloodAttributeName\":\"Hart Beat\"/)
  end

  it 'to_json only serializes the attributes specified ' do
    expect(blood_bag_attribute.to_json(only: [:bbat_Id, :bbat_BloodBag])).to eq("{\"bbat_Id\":1,\"bbat_BloodBag\":12345}")
  end

  it 'to_json serializes all attributes except the one specified' do
    expect(blood_bag_attribute.to_json(except: [:id, :bbat_Id, :bbat_BloodBag, :bbat_BloodAttribute, ])).to eq("{\"bbat_BloodAttributeMnemonic\":\"HBEAT\",\"bbat_BloodAttributeName\":\"Hart Beat\",\"bbat_BloodAttrMinAfterStart\":null,\"bbat_BloodAttributeIsMandatory\":null,\"bbat_ExtraInfo\":null,\"bbat_Present\":null}")
  end

  it 'updates the value of specified string representation of the attribute if it is known' do
    blood_bag_attribute.update_attribute('bbat_ExtraInfo', '120')
    expect(blood_bag_attribute.bbat_ExtraInfo).to eq('120')
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

  it 'is_integer? returns true if the bbat_BloodAttributeMnemonic of the blood bag attribute starts with HBEAT' do
    expect(blood_bag_attribute.is_integer?).to be_truthy
  end

  it 'is_integer? returns false if the bbat_BloodAttributeMnemonic of the blood bag attribute does not start with HBEAT' do
    blood_bag_attribute.bbat_BloodAttributeMnemonic = 'COLOR'
    expect(blood_bag_attribute.is_integer?).to be_falsey
  end

  it 'is_integer? returns false if the bbat_BloodAttributeMnemonic of the blood bag attribute is nil' do
    blood_bag_attribute.bbat_BloodAttributeMnemonic = nil
    expect(blood_bag_attribute.is_integer?).to be_falsey
  end


end