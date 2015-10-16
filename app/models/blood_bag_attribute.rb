class BloodBagAttribute
  include ActiveModel::Validations
  include ActiveModel::Serialization

  attr_accessor :id,
                :bbat_Id, :bbat_BloodBag,
                :bbat_BloodAttribute,
                :bbat_BloodAttributeMnemonic, :bbat_BloodAttributeName,
                :bbat_BloodAttrMinAfterStart, :bbat_BloodAttributeIsMandatory,
                :bbat_ExtraInfo,:bbat_Present

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @id ||= object_id
  end

  def externalize
    bbat_BloodAttributeName ? bbat_BloodAttributeName : bbat_BloodAttributeMnemonic
  end

  def to_s
    id
  end

end