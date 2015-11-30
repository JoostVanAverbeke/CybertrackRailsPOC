require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the BloodBagAttributesHelper. For example:
#
# describe BloodBagAttributesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BloodBagAttributesHelper, type: :helper do

  let(:blood_bag_attribute_klejkljkl0_120) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 130, bbat_BloodAttributeMnemonic: "klejkljkl0", bbat_BloodAttributeName: "derdeparam0", bbat_BloodAttrMinAfterStart: 120, bbat_ExtraInfo: 45)
  }

  let(:blood_bag_attribute_Hemolysine_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 120, bbat_BloodAttributeMnemonic: "Hemolysine", bbat_BloodAttributeName: "Hemolysine", bbat_BloodAttrMinAfterStart: 15)
  }

  let(:blood_bag_attribute_P0_0) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 8, bbat_BloodAttributeMnemonic: "P0", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 0, bbat_ExtraInfo: 56)
  }

  let(:blood_bag_attribute_P15_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 9, bbat_BloodAttributeMnemonic: "P15", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 15, bbat_ExtraInfo: 72)
  }

  let(:blood_bag_attribute_P99_9999) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 10, bbat_BloodAttributeMnemonic: "P99", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 9999)
  }

  let(:blood_bag_attribute_R0_0) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 5, bbat_BloodAttributeMnemonic: "R0", bbat_BloodAttributeName: "Bloeddruk", bbat_BloodAttrMinAfterStart: 0, bbat_ExtraInfo: 78)
  }

  let(:blood_bag_attribute_R15_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 6, bbat_BloodAttributeMnemonic: "R15", bbat_BloodAttributeName: "Bloeddruk", bbat_BloodAttrMinAfterStart: 15)
  }

  let(:blood_bag_attribute_R99_9999) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 7, bbat_BloodAttributeMnemonic: "R99", bbat_BloodAttributeName: "Bloeddruk", bbat_BloodAttrMinAfterStart: 9999, bbat_ExtraInfo: 108)
  }

  let(:blood_bag_attribute_T0_0) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 2, bbat_BloodAttributeMnemonic: "T0", bbat_BloodAttributeName: "Temperatuur", bbat_BloodAttrMinAfterStart: 0, bbat_ExtraInfo: 38.2)
  }

  let(:blood_bag_attribute_T15_15) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 3, bbat_BloodAttributeMnemonic: "T15", bbat_BloodAttributeName: "Temperatuur", bbat_BloodAttrMinAfterStart: 15, bbat_ExtraInfo: 38.4)
  }

  let(:blood_bag_attribute_T99_9999) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 4, bbat_BloodAttributeMnemonic: "T99", bbat_BloodAttributeName: "Temperatuur", bbat_BloodAttrMinAfterStart: 9999, bbat_ExtraInfo: 37.5)
  }

  let(:blood_bag_attribute_gewicht0_0) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 129, bbat_BloodAttributeMnemonic: "gewicht0", bbat_BloodAttributeName: "gewicht", bbat_BloodAttrMinAfterStart: 0)
  }

  let(:blood_bag_attribute_P30_30) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 118, bbat_BloodAttributeMnemonic: "P30", bbat_BloodAttributeName: "Pols", bbat_BloodAttrMinAfterStart: 30, bbat_ExtraInfo: 102)
  }

  let(:blood_bag_attribute_TEST0_75) {
    FactoryGirl.build(:blood_bag_attribute, bbat_BloodAttribute: 128, bbat_BloodAttributeMnemonic: "TEST0", bbat_BloodAttributeName: "Kleur", bbat_BloodAttrMinAfterStart: 75)
  }

  let(:blood_bag_attributes) {
    [
        blood_bag_attribute_gewicht0_0, blood_bag_attribute_Hemolysine_15, blood_bag_attribute_klejkljkl0_120,
        blood_bag_attribute_P0_0, blood_bag_attribute_P15_15, blood_bag_attribute_P30_30, blood_bag_attribute_P99_9999,
        blood_bag_attribute_R0_0, blood_bag_attribute_R15_15, blood_bag_attribute_R99_9999,
        blood_bag_attribute_T0_0, blood_bag_attribute_T15_15, blood_bag_attribute_T99_9999,
        blood_bag_attribute_TEST0_75
    ]
  }

  it 'returns the href format: #<label> for the specified label' do
    expect(helper.anchor_href('label')).to eq('#label')
  end

  it 'returns an array of graph plots' do
    expect(helper.graph_plots(blood_bag_attributes).length).to eq(2)
    puts "plot[0] = #{helper.graph_plots(blood_bag_attributes)[0].inspect}"
    puts "plot[1] = #{helper.graph_plots(blood_bag_attributes)[1].inspect}"
  end
end
