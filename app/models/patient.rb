class Patient

  attr_accessor :prsn_Id, :prsn_FirstName, :prsn_LastName, :prsn_BirthDate, :prsn_Object, :prsn_Externalization, :prsn_Gender, :prsn_BagsAtLabOrWard

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def externalize
    prsn_Externalization
  end

end