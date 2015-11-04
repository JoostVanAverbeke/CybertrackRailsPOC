class Patient

  attr_accessor :prsn_Id, :prsn_FirstName, :prsn_LastName, :prsn_BirthDate, :prsn_Object, :prsn_Externalization,
                :prsn_Gender, :prsn_BagsAtLabOrWard, :prsn_Sex, :prsn_BloodGroup, :prsn_BloodGroupString,
                :prsn_Rhesus, :prsn_RhesusString, :prsn_PositiveScreening, :prsn_TransfusionAdvice,
                :prsn_TransfusionReaction, :prsn_Ward, :prsn_WardName, :prsn_Room, :prsn_EncounterStartTime,
                :prsn_StayStartTime

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def externalize
    prsn_Externalization
  end

  def blood_group
    prsn_RhesusString ? "#{prsn_BloodGroupString} #{prsn_RhesusString}" : prsn_BloodGroupString
  end

end