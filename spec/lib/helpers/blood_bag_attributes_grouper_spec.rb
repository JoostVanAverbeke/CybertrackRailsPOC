require 'rails_helper'

describe BloodBagAttributesGrouper do
  let(:blood_bag_attribute_klejkljkl0_120) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 130, bbat_BloodAttributeMnemonic: "klejkljkl0", bbat_BloodAttributeName: "derdeparam0", bbat_BloodAttrMinAfterStart: 120)
  }

  let(:blood_bag_attribute_Hemolysine_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 120, bbat_BloodAttributeMnemonic: "Hemolysine", bbat_BloodAttributeName: "Hemolysine", bbat_BloodAttrMinAfterStart: 15)
  }

  let(:blood_bag_attribute_P0_0) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 8, bbat_BloodAttributeMnemonic: "P0", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 0)
  }

  let(:blood_bag_attribute_P15_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 9, bbat_BloodAttributeMnemonic: "P15", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 15)
  }

  let(:blood_bag_attribute_P99_9999) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 10, bbat_BloodAttributeMnemonic: "P99", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 9999)
  }

  let(:blood_bag_attribute_R0_0) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 5, bbat_BloodAttributeMnemonic: "R0", bbat_BloodAttributeName: "Bloeddruk", bbat_BloodAttrMinAfterStart: 0)
  }

  let(:blood_bag_attribute_R15_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 6, bbat_BloodAttributeMnemonic: "R15", bbat_BloodAttributeName: "Bloeddruk", bbat_BloodAttrMinAfterStart: 15)
  }

  let(:blood_bag_attribute_R99_9999) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 7, bbat_BloodAttributeMnemonic: "R99", bbat_BloodAttributeName: "Bloeddruk", bbat_BloodAttrMinAfterStart: 9999)
  }

  let(:blood_bag_attribute_T0_0) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 2, bbat_BloodAttributeMnemonic: "T0", bbat_BloodAttributeName: "Temperatuur", bbat_BloodAttrMinAfterStart: 0)
  }

  let(:blood_bag_attribute_T15_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 3, bbat_BloodAttributeMnemonic: "T15", bbat_BloodAttributeName: "Temperatuur", bbat_BloodAttrMinAfterStart: 15)
  }

  let(:blood_bag_attribute_T99_9999) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 4, bbat_BloodAttributeMnemonic: "T99", bbat_BloodAttributeName: "Temperatuur", bbat_BloodAttrMinAfterStart: 9999)
  }

  let(:blood_bag_attribute_gewicht0_0) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 129, bbat_BloodAttributeMnemonic: "gewicht0", bbat_BloodAttributeName: "gewicht", bbat_BloodAttrMinAfterStart: 0)
  }

  let(:blood_bag_attribute_P30_30) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 118, bbat_BloodAttributeMnemonic: "P30", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 30)
  }

  let(:blood_bag_attribute_TEST0_75) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 128, bbat_BloodAttributeMnemonic: "TEST0", bbat_BloodAttributeName: "Kleur", bbat_BloodAttrMinAfterStart: 75)
  }

  let(:blood_bag_attribute_array) {
    [
        blood_bag_attribute_gewicht0_0, blood_bag_attribute_Hemolysine_15, blood_bag_attribute_klejkljkl0_120,
        blood_bag_attribute_P0_0, blood_bag_attribute_P15_15, blood_bag_attribute_P30_30, blood_bag_attribute_P99_9999,
        blood_bag_attribute_R0_0, blood_bag_attribute_R15_15, blood_bag_attribute_R99_9999,
        blood_bag_attribute_T0_0, blood_bag_attribute_T15_15, blood_bag_attribute_T99_9999,
        blood_bag_attribute_TEST0_75
    ]
  }

  let(:blood_bag_attributes_grouper) { BloodBagAttributesGrouper.new(blood_bag_attribute_array)}

  it 'returns an array of the different bbat_BloodAttrMinAfterStart in the array of blood bag attributes' do
    expect(blood_bag_attributes_grouper.groups.length).to eq(6)
  end

  it 'the created group with key (15) has got 4 attributes' do
    groups = blood_bag_attributes_grouper.groups
    group_15 = groups.select {|group| group.key == 15 }.first
    expect(group_15.attributes.length).to eq(4)
  end

  it 'returns an array of the different bbat_BloodAttributeNames in the array of blood bag attributes' do
    expect(blood_bag_attributes_grouper.attributes.length).to eq(7)
  end

  it 'the created group with blood bag attribute name (Pols) has got 4 attributes' do
    attributes = blood_bag_attributes_grouper.attributes
    group_pols = attributes.select{ |group| group.key == 'Pols'}.first
    expect(group_pols.attributes.length).to eq(4)
  end

end