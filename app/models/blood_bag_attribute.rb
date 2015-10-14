class BloodBagAttribute

  attr_accessor :bbat_Id, :bbat_BloodBag,
                :bbat_BloodAttribute,
                :bbat_BloodAttributeMnemonic, :bbat_BloodAttributeName,
                :bbat_BloodAttrMinAfterStart, :bbat_BloodAttributeIsMandatory,
                :bbat_ExtraInfo,:bbat_Present

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def externalize
    bbat_BloodAttributeName ? bbat_BloodAttributeName : bbat_BloodAttributeMnemonic
  end

end