class BloodSelection


  attr_accessor :bsel_Id, :bsel_Object, :bsel_Person, :bsel_Status, :bsel_StatusString, :bsel_Ward, :bsel_WardName, :bsel_Room,
                :bsel_OrderInternalId, :bsel_OrderLowestObjectTime, :bsel_ObjectExternalization, :bsel_ProductMnemonic,
                :bsel_SeqNo, :bsel_BloodBagStatus, :bsel_BloodBagStatusString, :bsel_BloodGroup, :bsel_BloodGroupString,
                :bsel_Rhesus, :bsel_RhesusString, :bsel_PositiveScreening, :bsel_BloodBag, :bsel_OrderLowestObjectDateTime,
                :bsel_BloodBagTrsfStartTime

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def pending?
    theme = case bsel_Status
              when 1 then true
              when 2 then true
              when 3 then true
              else false
    end
  end

end