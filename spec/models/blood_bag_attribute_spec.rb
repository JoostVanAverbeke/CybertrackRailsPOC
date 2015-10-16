require 'rails_helper'

describe BloodBagAttribute do
  let(:blood_bag_attribute) { BloodBagAttribute.new({
                                                        bbat_Id: 1, bbat_BloodBag: 12345,
                                                        bbat_BloodAttribute: 457349,
                                                        bbat_BloodAttributeMnemonic: "HBEAT",
                                                        bbat_BloodAttributeName: "Hart Beat"
                                                    })
  }
  it 'to_s returns the object_id of the blood_bag_attribute object' do
    expect(blood_bag_attribute.to_s).to eq(blood_bag_attribute.object_id)
  end

  it 'to_json returns the json representation of the  blood_bag_attribute object' do
    expect(blood_bag_attribute.to_json).to "\"bbat_Id\":1,\"bbat_BloodBag\":12345,\"bbat_BloodAttribute\":457349,\"bbat_BloodAttributeMnemonic\":\"HBEAT\",\"bbat_BloodAttributeName\":\"Hart Beat\""
  end
end