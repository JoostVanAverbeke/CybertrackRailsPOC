class BloodSelection


  attr_accessor :bsel_Id, :bsel_Object, :bsel_Person, :bsel_Status, :bsel_StatusString, :bsel_Ward, :bsel_WardName, :bsel_Room,
                :bsel_OrderInternalId, :bsel_OrderLowestObjectTime, :bsel_ObjectExternalization, :bsel_ProductMnemonic,
                :bsel_SeqNo, :bsel_BloodBagStatus, :bsel_BloodBagStatusString, :bsel_BloodGroup, :bsel_BloodGroupString,
                :bsel_Rhesus, :bsel_RhesusString, :bsel_PositiveScreening, :bsel_BloodBag, :bsel_OrderLowestObjectDateTime,
                :bsel_BloodBagTrsfStartTime, :bsel_BloodBagExternalId

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def externalize
    if bsel_BloodBagExternalId.blank?
      "#{bsel_ProductMnemonic} #{bsel_StatusString}"
    else
      "#{bsel_BloodBagExternalId} #{bsel_ProductMnemonic} #{bsel_StatusString}"
    end
  end

  def blood_group
    "#{bsel_BloodGroupString} #{bsel_RhesusString}"
  end

  def pending?
    !past?
  end

  def past?
    bsel_StatusString == 'Administered'
  end

  def location
    unless bsel_WardName.blank?
      bsel_Room.blank? ? bsel_WardName : "#{bsel_WardName} #{bsel_Room}"
    end
  end

end