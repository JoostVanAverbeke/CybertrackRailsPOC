class Patient

  attr_accessor :prsn_Id, :prsn_FirstName, :prsn_LastName, :prsn_BirthDate, :prsn_Object, :prsn_Externalization,
                :prsn_Gender, :prsn_BagsAtLabOrWard, :prsn_Sex, :prsn_BloodGroup, :prsn_BloodGroupString,
                :prsn_Rhesus, :prsn_RhesusString, :prsn_PositiveScreening, :prsn_TransfusionAdvice,
                :prsn_TransfusionReaction

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def externalize
    prsn_Externalization
  end

end