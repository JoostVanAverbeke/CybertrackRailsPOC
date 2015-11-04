class BloodBagAttribute
  include ActiveModel::AttributeMethods
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

  # Define an +attributes+ method which returns a hash with each
  #   attribute name in your model as hash key and the attribute value as hash value.
  #   Hash keys must be strings
  # See also rails/activemodel/attribute_methods documentation
  def attributes
    {
        'id' => @id,
        'bbat_Id' => @bbat_Id, 'bbat_BloodBag' => @bbat_BloodBag, 'bbat_BloodAttribute' => @bbat_BloodAttribute,
        'bbat_BloodAttributeMnemonic' => @bbat_BloodAttributeMnemonic,
        'bbat_BloodAttributeName' => @bbat_BloodAttributeName,
        'bbat_BloodAttrMinAfterStart' => @bbat_BloodAttrMinAfterStart,
        'bbat_BloodAttributeIsMandatory' => @bbat_BloodAttributeIsMandatory,
        'bbat_ExtraInfo' => @bbat_ExtraInfo, 'bbat_Present' => @bbat_Present
    }
  end

  def to_json(options = nil)
    serializable_hash(options).to_json
  end

  def externalize
    bbat_BloodAttributeName ? bbat_BloodAttributeName : bbat_BloodAttributeMnemonic
  end

  def to_s
    "#{id}"
  end

  def update_attributes(attributes = {})
    attributes.each do |name, value|
      update_attribute(name, value)
    end
    if bbat_ExtraInfo
       @bbat_Present = true
    end
  end

  def update_attribute(name, value)
    name = name.to_s
    # verify_readonly_attribute(name)
    send("#{name}=", value)
  end

end