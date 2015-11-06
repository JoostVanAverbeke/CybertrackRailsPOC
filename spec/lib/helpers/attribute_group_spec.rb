require 'rails_helper'

describe AttributeGroup do
  let(:blood_bag_attribute_P15_15) {
    BloodBagAttribute.new({"bbat_Id" => nil, "bbat_BloodBag" => 456575, "bbat_BloodAttribute" => 9, "bbat_BloodAttributeMnemonic" => "P15", "bbat_BloodAttributeName" => "Pols", "bbat_BloodAttrMinAfterStart" => 15, "bbat_BloodAttributeIsMandatory" => false, "bbat_ExtraInfo" => nil, "bbat_Present" => nil})
  }

  let(:blood_bag_attribute_R15_15) {
    BloodBagAttribute.new({"bbat_Id" => nil, "bbat_BloodBag" => 456575, "bbat_BloodAttribute" => 6, "bbat_BloodAttributeMnemonic" => "R15", "bbat_BloodAttributeName" => "Bloeddruk", "bbat_BloodAttrMinAfterStart" => 15, "bbat_BloodAttributeIsMandatory" => false, "bbat_ExtraInfo" => nil, "bbat_Present" => nil})
  }

  let(:attribute_group) { AttributeGroup.new(15, 'label') }

  it 'constructs an instance given a key and a label' do
    expect(attribute_group).not_to be_nil
    expect(attribute_group.attributes.length).to eq(0)
  end

  it '<< method pushes the given attribute on to the end of its attributes array' do
    attribute_group << blood_bag_attribute_P15_15
    expect(attribute_group.attributes.length).to eq(1)
  end

  it 'push is an alias method for <<' do
    attribute_group.push blood_bag_attribute_P15_15
    attribute_group.push blood_bag_attribute_R15_15
    expect(attribute_group.attributes.length).to eq(2)
  end

  it 'returns the pushed attribute' do
    attribute_group.push blood_bag_attribute_P15_15
    expect(attribute_group.attributes[0]).to be(blood_bag_attribute_P15_15)
  end

end
