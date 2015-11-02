FactoryGirl.define do
  factory :blood_bag_attribute do
    bbat_Id nil
    bbat_BloodBag 456575
    bbat_BloodAttribute 5
    bbat_BloodAttributeMnemonic 'R0'
    bbat_BloodAttributeName 'Bloeddruk'
    bbat_BloodAttrMinAfterStart 0
    bbat_BloodAttributeIsMandatory false
    bbat_ExtraInfo nil
    bbat_Present nil
  end
end