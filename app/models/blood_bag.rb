class BloodBag
  attr_accessor :bbag_Id, :bbag_BloodProduct, :bbag_BloodProductMnemonic

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def externalize
    bbag_BloodProductMnemonic
  end
end