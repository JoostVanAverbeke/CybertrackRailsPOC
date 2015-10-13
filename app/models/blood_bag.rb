class BloodBag
  attr_accessor :blbg_Id,

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end