require 'rails_helper'

describe AttributeGroup do
  let(:blood_bag_attribute_P15_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 9, bbat_BloodAttributeMnemonic: "P15", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 15, bbat_ExtraInfo: 95)
  }

  let(:blood_bag_attribute_R15_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 6, bbat_BloodAttributeMnemonic: "R15", bbat_BloodAttributeName: "Bloeddruk", bbat_BloodAttrMinAfterStart: 15, bbat_ExtraInfo: 95)
  }

  let(:blood_bag_attribute_P30_30) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 118, bbat_BloodAttributeMnemonic: "P30", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 30, bbat_ExtraInfo: 90)
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

  it 'is_numeric? returns true if all its attributes are numeric' do
    attribute_group << blood_bag_attribute_P15_15
    attribute_group << blood_bag_attribute_P30_30
    # attribute_group << FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttributeMnemonic: "NOT_NUMERIC")
    expect(attribute_group.is_numeric?).to be(true)
  end

  it 'returns an array of coordinates of its attributes if they are numeric' do
    pols_attribute_group = AttributeGroup.new('Pols', nil)
    pols_attribute_group.concat([blood_bag_attribute_P15_15, blood_bag_attribute_P30_30])
    expect(pols_attribute_group.coordinates.length).to eq(2)
  end

end
