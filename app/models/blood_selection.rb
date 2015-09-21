class BloodSelection


  attr_accessor :bsel_Id, :bsel_Object, :bsel_Person, :bsel_Status, :bsel_StatusString, :bsel_Ward, :bsel_WardName, :bsel_Room,
                :bsel_OrderInternalId, :bsel_OrderLowestObjectTime, :bsel_ObjectExternalization, :bsel_ProductMnemonic,
                :bsel_SeqNo, :bsel_BloodBagStatus, :bsel_BloodBagStatusString, :bsel_BloodGroup, :bsel_BloodGroupString,
                :bsel_Rhesus, :bsel_RhesusString, :bsel_PositiveScreening

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end