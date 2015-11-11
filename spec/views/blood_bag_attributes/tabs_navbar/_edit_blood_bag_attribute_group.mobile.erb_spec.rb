require "rails_helper"

RSpec.describe "partial blood_bag_attributes/_edit_blood_bag_attribute_group.mobile" do
  let(:blood_bag_attribute_P15_15) {
    BloodBagAttribute.new({"bbat_Id" => nil, "bbat_BloodBag" => 456575, "bbat_BloodAttribute" => 9, "bbat_BloodAttributeMnemonic" => "P15", "bbat_BloodAttributeName" => "Pols", "bbat_BloodAttrMinAfterStart" => 15, "bbat_BloodAttributeIsMandatory" => false, "bbat_ExtraInfo" => "78", "bbat_Present" => nil})
  }

  let(:blood_bag_attribute_R15_15) {
    BloodBagAttribute.new({"bbat_Id" => nil, "bbat_BloodBag" => 456575, "bbat_BloodAttribute" => 6, "bbat_BloodAttributeMnemonic" => "R15", "bbat_BloodAttributeName" => "Bloeddruk", "bbat_BloodAttrMinAfterStart" => 15, "bbat_BloodAttributeIsMandatory" => false, "bbat_ExtraInfo" => nil, "bbat_Present" => nil})
  }

  let(:attribute_group) {
    group = AttributeGroup.new(15, 'the label')
    group.concat([blood_bag_attribute_P15_15, blood_bag_attribute_R15_15])
    group
  }

  it 'displays the blood bag attribute of this group' do
    render :partial => "blood_bag_attributes/tabs_navbar/edit_blood_bag_attribute_group.mobile.erb", :locals => { group: attribute_group}

    expect(rendered).to match /the label/
    expect(rendered).to match /Pols/
    expect(rendered).to match /78/
    expect(rendered).to match /Bloeddruk/
  end
end
