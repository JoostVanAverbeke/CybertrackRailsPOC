class BloodBag
  include ActiveModel::AttributeMethods
  include ActiveModel::Serialization

  attr_accessor :bbag_Id, :bbag_BloodProduct, :bbag_BloodProductMnemonic

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  # Define an +attributes+ method which returns a hash with each
  #   attribute name in your model as hash key and the attribute value as hash value.
  #   Hash keys must be strings
  # See also rails/activemodel/attribute_methods documentation
  def attributes
    {
      'bbag_Id' => @bbag_Id, 'bbag_BloodProduct' => @bbag_BloodProduct,
      'bbag_BloodProductMnemonic' => @bbag_BloodProductMnemonic
    }
  end

  def to_json(options = nil)
    serializable_hash(options).to_json
  end

  def externalize
    bbag_BloodProductMnemonic
  end
end